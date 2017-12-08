"""Book recommendations."""

from jinja2 import StrictUndefined

from flask_debugtoolbar import DebugToolbarExtension

from flask import (Flask, render_template, redirect, request, flash,
                   session, jsonify, url_for)

# from flask_login import LoginManager, login_user, login_required, logout_user

from model import Book, Genre, User, UserGenre, Rating, recommend, connect_to_db, db, generate_colors

from sqlalchemy import desc, func

import json

import bcrypt

app = Flask(__name__)

# Required to use Flask sessions and the debug toolbar
app.secret_key = "hostesswiththemostest"
#change to True if debugging
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = True


# Normally, if you use an undefined variable in Jinja2, it fails
# silently. This is horrible. Fix this so that, instead, it raises an
# error.
app.jinja_env.undefined = StrictUndefined


#use flask-login to instantiate a login_manager and tie it to the flask app
# login_manager = LoginManager()
# login_manager.init_app(app)

# #sets a view for if a user tries to access a login_required route
# login_manager.login_view = "/login"


# @login_manager.unauthorized_handler
# def unauthorized():
#     flash("Please log in to access this page.")
#     return redirect(url_for('log_in', next="/"), user=load_user())


@app.route('/')
def index():
    """Homepage."""

    try:
        user = User.query.filter_by(email=session["email"]).first()
    except KeyError:
        return render_template('homepage.html')

    return render_template('homepage.html', user=user)


# @login_manager.user_loader
# def load_user(user_id):
#     return User.query.get(user_id)


@app.route("/register", methods=["GET", "POST"])
def confirm_registration():
    """Displays registration form if request is GET and registers user if request is POST"""

    if request.method == "GET":

        return render_template('register.html')

    elif request.method == "POST":

        name = request.form.get("name")
        email = request.form.get("email")
        submittedPassword = request.form.get("password")

        duplicates = db.session.query(User).filter_by(email=email).all()

        if duplicates:
            flash("This email is already registered. Please try again with a different email.")
            return render_template("homepage.html")
        else:
            hashedPassword = bcrypt.hashpw(submittedPassword.encode('utf-8'), bcrypt.gensalt(10))
            new_user = User(name=name, email=email, password=hashedPassword)
            db.session.add(new_user)
            # login_user(new_user)
            db.session.commit()
            flash("You have been registered and logged in! Yay!")
            session['email'] = email
            return render_template("homepage.html", user=new_user)


@app.route("/login", methods=["GET", "POST"])
def log_in():
    """Displays login form if request is GET and logs user in if request is POST"""

    if request.method == 'GET':

        return render_template('login.html')

    elif request.method == 'POST':

        email = request.form.get("email")
        password = request.form.get("password")

        user = db.session.query(User).filter_by(email=email).first()

        try:
            user.user_id

            if user and bcrypt.checkpw(password.encode('utf8'), user.password.encode('utf8')):
                session['email'] = email
                # login_user(user, remember=True)
                flash("You have been logged in!")
                # next = request.args.get('next')
                return render_template("homepage.html", user=user)
            else:
                flash("Login failed. Email or password was not correct.")
                return redirect("/")

        except AttributeError:
            flash("Login failed. Email or password was not correct.")
            return redirect("/")
# url_for("user_details", some_id=str(user.user_id))


@app.route("/logout")
# @login_required
def log_out():
    """Logs the user out"""
    # logout_user()
    del session['email']
    flash("You are logged out!")

    return redirect("/")


@app.route("/books")
# @login_required
def book_list():
    """Show list of books."""

    user = User.query.filter_by(email=session["email"]).first()
    books = Book.query.order_by(desc('avg_rating')).all()

    return render_template("all_books.html", books=books, user=user)


@app.route("/reviews")
# @login_required
def review_page():
    """Make page for reviews graph"""

    user = User.query.filter_by(email=session["email"]).first()

    return render_template("reviews_page.html", user=user)


@app.route("/reviews.json")
def reviews():
    """Visualize machine learning data from review analysis"""

    json_string = open("review_words.json").read()
    review_dict = json.loads(json_string)

    data_dict = {
        "labels": [],
        "datasets": [
            {
                "label": "Log Probability",
                "backgroundColor": [],
                "data": []
            }
        ]
    }

    for item in review_dict["neg"][:10]:
        data_dict["labels"].append(item[1])
        data_dict["datasets"][0]['data'].append(item[0])
        data_dict["datasets"][0]["backgroundColor"].append(generate_colors())

    for item in review_dict["pos"][:10]:
        data_dict["labels"].append(item[1])
        data_dict["datasets"][0]['data'].append(item[0])
        data_dict["datasets"][0]["backgroundColor"].append(generate_colors())

    return jsonify(data_dict)


@app.route("/genres")
# @login_required
def all_genres():
    """Show all genres in db"""

    user = User.query.filter_by(email=session["email"]).first()
    genres = Genre.query.order_by('name').all()
    return render_template("all_genres.html", genres=genres, user=user)


@app.route("/genre_info.json")
def show_genre_info():
    """Pass genre information to pie chart"""

    genre_list = Genre.query.all()

    data_dict = {
        "labels": [],

        "datasets": [
            {
                "data": [],
                "backgroundColor": []
            }

        ]
    }

    for genre in genre_list:
        if len(genre.books) > 50:
            data_dict["labels"].append(genre.name)
            data_dict["datasets"][0]['data'].append(len(genre.books))
            data_dict["datasets"][0]["backgroundColor"].append(generate_colors())

    return jsonify(data_dict)


@app.route("/autocomplete")
def search():
    """searches the db for user's search term"""

    param = request.args.get("term")

    books = Book.query.filter(Book.title.ilike('%'+param+'%')).all()

    results = []

    for book in books:
        results.append({"id": "/books/" + str(book.book_id), "value": book.title})

    return jsonify(results)


@app.route("/users/<some_id>")
# @login_required
def user_details(some_id):
    """Shows user details."""

    user = User.query.get(some_id)

    if user and session['email'] == user.email:
        genres = Genre.query.limit(3)
        return render_template("user_page.html", user=user, genres=genres)
    else:
        flash("Sorry, you must log in to your account to view user details.")
        return redirect("/")


@app.route("/books/<some_id>")
# @login_required
def book_details(some_id):
    """Shows book details."""

    user = User.query.filter(User.email == session['email']).first()

    book = Book.query.get(some_id)

    rating = Rating.query.filter(Rating.user_id == user.user_id, Rating.book_id == book.book_id).first()

    return render_template("book_page.html", book=book, user=user, rating=rating)


@app.route("/genres", methods=["POST"])
def get_three_genres():
    """Returns 3 genres from the db"""

    counter = request.form.get("counter")

    if counter >= 0:
        genres = Genre.query.limit(3).offset(counter).all()

    json_genres = {}

    for genre in genres:
        json_genres[genre.genre_id] = genre.name

    return jsonify(json_genres)


@app.route("/add-a-genre", methods=["POST"])
def add_a_genre():
    """Adds the genre a user has selected to UserGenre"""

    genre_name = request.form.get("genre_name")
    user_email = session['email']

    matching_genre = Genre.query.filter(Genre.name.like("%"+genre_name+"%")).first()
    matching_user = User.query.filter(User.email == user_email).first()

    possible_duplicate = UserGenre.query.filter(UserGenre.user_id == matching_user.user_id, UserGenre.genre_id == matching_genre.genre_id).first()

    if possible_duplicate:
        return jsonify({"message": "You have already added this genre to your list of favs!",
                        "genre": "nope"})

    new_user_genre = UserGenre(user_id=matching_user.user_id, genre_id=matching_genre.genre_id)
    db.session.add(new_user_genre)
    db.session.commit()

    matching = {}
    matching["genre"] = matching_genre.name
    matching["message"] = "You have added " + matching_genre.name + " to your list of favs!"

    return jsonify(matching)


@app.route("/remove-a-genre", methods=["POST"])
def remove_a_genre():
    """Removes the faved genre a user has clicked from their list of faves"""

    genre_name = request.form.get("genre_name")
    user_email = session["email"]

    matching_genre = Genre.query.filter(Genre.name.like("%"+genre_name+"%")).first()
    matching_user = User.query.filter(User.email == user_email).first()

    matching_user_genre = UserGenre.query.filter(UserGenre.user_id == matching_user.user_id, UserGenre.genre_id == matching_genre.genre_id).first()

    db.session.delete(matching_user_genre)
    db.session.commit()

    matching = {}
    matching["genre"] = matching_genre.name

    return jsonify(matching)


@app.route("/recommend")
def make_recommendations():
    """calls the recommend function to recommend books to the user"""

    user = User.query.filter_by(email=session["email"]).first()

    list_of_recommendations = recommend(user)

    json_recs = {}

    for book in list_of_recommendations:
        json_recs[book.book_id] = [book.title, book.author]

    return jsonify(json_recs)


@app.route("/rate", methods=["POST"])
def rate_book():
    """Passes rating for book"""

    book_id = request.form.get("book")
    score = int(request.form.get("score"))
    book = Book.query.get(book_id)

    try:
        email = session['email']

        user = User.query.filter_by(email=email).first()
        user_id = user.user_id
        rating = Rating.query.filter(Rating.user_id == user_id, Rating.book_id == book_id).first()
        if rating:
            rating.score = score
            db.session.commit()
            flash("You have updated your rating for " + book.title + " to " + str(score) + " star(s).")
            return render_template("book_page.html", book=book, user=user, rating=rating)
        else:
            new_rating = Rating(book_id=book_id, user_id=user_id, score=score)
            db.session.add(new_rating)
            db.session.commit()
            flash("You have given " + book.title + " " + str(score) + " star(s).")
            return render_template("book_page.html", book=book, user=user, rating=new_rating)

    except KeyError:
        flash("Not a valid user logged in!")
        return redirect("/")


if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the
    # point that we invoke the DebugToolbarExtension
    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run(port=5000, host='0.0.0.0')
