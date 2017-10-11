"""Models and database functions"""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


##############################################################################
# Model definitions

class User(db.Model):
    """ Users of the site"""
    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(100), nullable=False)

    genres = db.relationship('Genre', secondary="users_genres", backref='users')

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<User user_id=%s name=%s>" % (self.user_id, self.name)


class UserGenre(db.Model):
    """association table for users and genres"""
    __tablename__ = "users_genres"

    user_genre_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    genre_id = db.Column(db.Integer, db.ForeignKey('genres.genre_id'), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<UserGenre user_genre_id=%s user_id=%s>" % (
            self.user_genre_id, self.user_id)


class Rating(db.Model):
    """Ratings users have given a book"""
    __tablename__ = "ratings"

    rating_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=True)
    book_id = db.Column(db.Integer, db.ForeignKey('books.book_id'), nullable=False)
    score = db.Column(db.Integer, nullable=False)
    text = db.Column(db.String(10000), nullable=True)

    book = db.relationship('Book', backref='ratings')
    user = db.relationship('User', backref='ratings')

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Rating rating_id=%s user_id=%s book_id=%s score=%s>" % (
            self.rating_id, self.user_id, self.book_id, self.score)


class Book(db.Model):
    """Book info scraped from Goodreads."""

    __tablename__ = "books"

    book_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String(200), nullable=False)
    author = db.Column(db.String(200), nullable=False)
    avg_rating = db.Column(db.Integer, nullable=False)
    pic_url = db.Column(db.String(200), nullable=False)
    summary = db.Column(db.String(1000), nullable=False)

    genres = db.relationship('Genre', secondary="books_genres", backref='books')

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Book book_id=%s title=%s>" % (self.book_id, self.title)


class BookGenre(db.Model):
    """ Genre-book association table"""
    __tablename__ = "books_genres"

    book_genre_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    book_id = db.Column(db.Integer, db.ForeignKey('books.book_id'), nullable=False)
    genre_id = db.Column(db.Integer, db.ForeignKey('genres.genre_id'), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<BookGenre book_genre_id=%s book_id=%s genre_id=%s>" % (self.bookgenre_id, self.book_id, self.genre_id)


class Genre(db.Model):
    """ Genres of books, scraped from Goodreads."""
    __tablename__ = "genres"

    genre_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Genre genre_id=%s name=%s>" % (self.genre_id, self.name)


##############################################################################
# Helper functions

def recommend(user):
    """Given a user, recommend a book or books for them"""

    book_genre_dict = {}

    # creates a dictionary where the key is a book object and the value is a list of genres that book belongs to
    #all of those genres are genres the user has favorited

    for genre in user.genres:
        for book in genre.books:
            if book in book_genre_dict:
                book_genre_dict[book].append(genre)
            else:
                book_genre_dict[book] = [genre]

    list_of_recommendations = []

    for book in book_genre_dict.keys():
        if set(user.genres) <= set(book.genres):
            list_of_recommendations.append(book)
        elif len(set(user.genres) & set(book.genres)) > 2:
            list_of_recommendations.append(book)

    return list_of_recommendations


def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our PstgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///goodreads'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
