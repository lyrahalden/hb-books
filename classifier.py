import numpy as np

from sklearn.linear_model import LogisticRegression
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB, BernoulliNB
from sklearn import cross_validation
from sklearn import metrics

from model import Rating, db, connect_to_db


def import_reviews():
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
            if line[3] == '1' or line[3] == '2':
                labels.append('neg')
                documents.append(line[4:])

            elif line[3] == '4' or line[3] == '5':
                labels.append('pos')
                documents.append(line[4:])

    return (labels, documents)


def make_vectors(labels, documents):
    """makes vectors out of lists of labels and review texts"""

    vectorizer = TfidfVectorizer()

    X = vectorizer.fit_transform(documents)
    y = np.array(labels)

    return (X, y)


def cross_validate(X, Y):
    """ performs cross validation given vectors"""

    #instantiate a classifier
    clf = BernoulliNB()

    cv = cross_validation.StratifiedKFold(Y, 5)

    precision = []
    recall = []

    for train, test in cv:
        X_train = X[train]
        X_test = X[text]
        y_train = y[train]
        y_test = y[test]

        clf.fit(X_train, y_train)
        y_hat = clf.predict(X_test)
        p,r,_,_ = metrics.precision_recall_fscore_support(y_test, y_hat)
        precision.append(p[1])
        recall.append(r[1])




if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
