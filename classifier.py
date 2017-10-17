import numpy as np

from sklearn.linear_model import LogisticRegression
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB, BernoulliNB
from sklearn import cross_validation
from sklearn import metrics

from model import Rating, db, connect_to_db

import json


def train_classifier():
    """ query the database and save the review and the score into two lists:
        labels (1 or 2 stars gets a negative label and 4 or 5 stars gets a positive label)
        and documents (the text of the review)"""

    labels = []
    documents = []

    # reviews = Rating.query.all()
    # for review in reviews:
    #     if (review.score == 1) or (review.score == 2):
    #         labels.append('neg')
    #         documents.append(review.text)
    #     elif (review.score == 4) or (review.score == 5):
    #         labels.append('pos')
    #         documents.append(review.text)

    with open('./reviews.csv') as f:
        for line in f:
            line_list = line.split('|')
            if line_list[3] == '1' or line_list[3] == '2':
                labels.append('neg')
                documents.append(line_list[4])

            elif line_list[3] == '4' or line_list[3] == '5':
                labels.append('pos')
                documents.append(line_list[4])

    vectorizer = TfidfVectorizer()

    X = vectorizer.fit_transform(documents)
    y = np.array(labels)

    clf = BernoulliNB()

    cv = cross_validation.StratifiedKFold(y, 5)

    precision = []
    recall = []

    for train, test in cv:
        X_train = X[train]
        X_test = X[test]
        y_train = y[train]
        y_test = y[test]

        clf.fit(X_train, y_train)
        y_hat = clf.predict(X_test)
        p, r, _, _ = metrics.precision_recall_fscore_support(y_test, y_hat)
        precision.append(p[1])
        recall.append(r[1])

    probs = clf.feature_log_prob_[1] - clf.feature_log_prob_[0]
    features = vectorizer.get_feature_names()

    neg_words = sorted(zip(probs, features))[:70]

    pos_words = sorted(zip(probs, features), reverse=True)[:70]

    data = {'neg': neg_words, 'pos': pos_words}

    with open('review_words.json', 'w') as fp:
        json.dump(data, fp)

    # print "precision:", precision
    # print "recall:", recall
    # # precision: [0.49899799599198397, 0.50997782705099781, 0.53636363636363638, 0.47765363128491622, 0.52771084337349394]
    # # recall: [0.6484375, 0.59895833333333337, 0.61458333333333337, 0.4453125, 0.5703125]





if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
