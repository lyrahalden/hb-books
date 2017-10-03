"""Get honeydew songs from iTunes."""

import requests

payload = {'term': 'honeydew'}

r = requests.get(
    "https://itunes.apple.com/search",
    params=payload)

melon_songs = r.json()

num_results = melon_songs['resultCount']

for i in range(num_results):
    trackName = melon_songs['results'][i].get('trackName')
    artistName = melon_songs['results'][i].get('artistName')
    print "%s : %s" % (trackName, artistName)
