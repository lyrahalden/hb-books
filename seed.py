"""Utility file to seed books database from goodreads data and sample user data"""

# from sqlalchemy import func
from model import Book, Genre, BookGenre
import json
# from model import Rating
# from model import Movie

from model import connect_to_db, db
from server import app
# from datetime import datetime


def load_books():
    """Load books and genres from books.json into database."""

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate data
    Book.query.delete()
    Genre.query.delete()
    BookGenre.query.delete()

    # Read scraped books.json file and turn json into python dictionary
    json_string = open("seed_data/books.json").read()
    books_dict = json.loads(json_string)

    #create empty dict that will keep track of all the unique genres
    all_genres = {}

    #for each book in our json file, assign title, author, rating, pic_url attributes
    for book in books_dict:
        title = book['title'].strip()
        author = book['author']
        rating = book['rating']
        pic_url = book['pic_url']

        #create empty list representing all genres for this book
        genres_for_this_book = []

        #loop through the genres for a particular book
        for genre in book['genres']:

            # if genre doesn't already exist in database:
            if genre not in all_genres:

                #make a new Genre object and add that Genre object to the database
                genre_obj = Genre(name=genre)
                db.session.add(genre_obj)

                #add a string representing the genre and its Genre object to the dict all_genres as a key-value pair
                all_genres[genre] = genre_obj

            #regardless of whether this exists in the database, add the corresponding Genre object to the list of genres for this book
            genres_for_this_book.append(all_genres[genre])

        #after the genre loop is complete, create a Book object and pass in all attributes, including a list of genres for this book
        book_obj = Book(title=title, author=author, rating=rating, pic_url=pic_url, genres=genres_for_this_book)

        db.session.add(book_obj)

    db.session.commit()
    print "Done!"


# def load_genres():
#     """Load genres from books.json into database."""

#     print "Genres"

#     Genre.query.delete()

#     json_string = open("scrapingtools/books.json").read()
#     books_dict = json.loads(json_string)

#         movie_id = rows[0]
#         title = rows[1]
#         released_str = rows[2]
#         imdb_url = rows[4]

#         if title:
#             title = title[:-7]
#         else:
#             continue

#         if released_str:
#             released_at = datetime.strptime(released_str, "%d-%b-%Y")
#         else:
#             released_at = None

#         movie = Movie(movie_id=movie_id, title=title, released_at=released_at, imdb_url=imdb_url)

#         db.session.add(movie)

#     db.session.commit()


# def load_ratings():
#     """Load ratings from u.data into database."""

#     print "Ratings"

#     Rating.query.delete()

#     for row in open("seed_data/u.data"):
#         row = row.rstrip()
#         rows = row.split("\t")

#         user_id = rows[0]
#         movie_id = rows[1]
#         score = rows[2]

#         rating = Rating(user_id=user_id, movie_id=movie_id, score=score)

#         db.session.add(rating)

#     db.session.commit()


# def set_val_user_id():
#     """Set value for the next user_id after seeding database"""

#     # Get the Max user_id in the database
#     result = db.session.query(func.max(User.user_id)).one()
#     max_id = int(result[0])

#     # Set the value for the next user_id to be max_id + 1
#     query = "SELECT setval('users_user_id_seq', :new_id)"
#     db.session.execute(query, {'new_id': max_id + 1})
#     db.session.commit()


if __name__ == "__main__":
    connect_to_db(app)

    db.drop_all()

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_books()
    # load_movies()
    # load_ratings()
    # set_val_user_id()
