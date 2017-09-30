import requests
import os
from urllib import urlencode
import xmltodict


def get_reviews_by_title(title):
    """Returns the reviews for a given book title"""

    my_key = os.environ['GOODREADS_DEV_KEY']

    payload = {'key': my_key, 'title': title}

    payload = urlencode(payload)

    r = requests.get("https://www.goodreads.com/book/title.xml", params=payload)

    results_dict = xmltodict.parse(r.content)

    return results_dict
