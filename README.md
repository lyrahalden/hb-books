# <img src="/static/img/owl-book-172.svg">

Novel Idea is my invidual project at Hackbright, made in 4.5 weeks. Novel Idea will recommend books to users based on books they rate and genres they favorite. Book data is scraped from Goodreads book lists using Scrapy. Book reviews are analyzed using a sentiment analyzer built with Python and Sci-kit Learn.

## Table of Contents

* [Tech Stack](#tech-stack)
* [Features](#features)
* [Setup/Installation](#installation)


## <a name="tech-stack"></a>Tech Stack

__Frontend:__ HTML, Javascript, Ajax, jQuery, Bootstrap <br/>
__Backend:__ Python, Flask, PostgreSQL, SQLAlchemy, Scrapy, Sci-kit Learn <br/>

## <a name="features"></a>Features

Register for an account, log in.
# <img src="/static/img/owl-book-172.svg">

View all books, search for a book by title.
# <img src="/static/img/read_me/books_page.png">
# <img src="/static/img/read_me/more_books.png">

View an individual book's page, rate it.
# <img src="/static/img/read_me/indiv_book_page.png">

View most popular genres.

View books you have rated.
# <img src="/static/img/read_me/prof_page.png">

Favorite genres or delete favorited genres.
# <img src="/static/img/read_me/ratings_genres.png">

Get a list of recommendations.
# <img src="/static/img/read_me/recommendation.png">


## <a name="installation"></a>Setup/Installation ⌨️

####Requirements:

- PostgreSQL
- Python 2.7

To have this app running on your local computer, please follow the below steps:

Clone repository:
```
$ git clone https://github.com/lyrahall14/hb-books
```
Create a virtual environment:
```
$ virtualenv env
```
Activate the virtual environment:
```
$ source env/bin/activate
```
Install dependencies:
```
$ pip install -r requirements.txt
```
Run the server:
```
$ python server.py
```




