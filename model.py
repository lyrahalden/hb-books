"""Models and database functions"""

from flask_sqlalchemy import SQLAlchemy

# This is the connection to the PostgreSQL database; we're getting this through
# the Flask-SQLAlchemy helper library. On this, we can find the `session`
# object, where we do most of our interactions (like committing, etc.)

db = SQLAlchemy()


##############################################################################
# Model definitions

class Book(db.Model):
    """Book info scraped from Goodreads."""

    __tablename__ = "books"

    book_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String(200), nullable=False)
    author = db.Column(db.String(200), nullable=False)
    rating = db.Column(db.String(200), nullable=False)
    pic_url = db.Column(db.String(200), nullable=False)

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

        return "<BookGenre bookgenre_id=%s book_id=%s genre_id=%s>" % (self.bookgenre_id, self.book_id, self.genre_id)


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