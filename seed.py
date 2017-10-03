"""Utility file to seed books database from goodreads data"""

from sqlalchemy import func
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

    # Read scraped books.json file and turn json into python dictionary
    json_string = open("scrapingtools/books.json").read()
    books_dict = json.loads(json_string)

    genres_list = []
    genres_dict = {}

    for item in books_dict:
        title = item['title'].strip()
        author = item['author']
        rating = item['rating']
        pic_url = item['pic_url']


        genres_for_this_book = []

        for genre in item['genres']:
            if genre not in genres_list:
                genres_list.append(genre)
                genre_obj = Genre(name=genre)
                db.session.add(genre_obj)
                genres_dict[genre] = genre_obj


            genres_for_this_book.append(genres_dict[genre])

        book = Book(title=title, author=author, rating=rating, pic_url=pic_url, genres=genres_for_this_book)

        db.session.add(book)

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

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_books()
    # load_movies()
    # load_ratings()
    # set_val_user_id()