import unittest
from server import app, generate_colors
from model import db, connect_to_db, example_data, User
from seed import set_val_user_id


class FlaskTests(unittest.TestCase):
    """Integration testing for flask site"""

    def setUp(self):
        """Things to do before every test"""

        self.client = app.test_client()
        app.config['TESTING'] = True
        app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    def tearDown(self):
        """Things to do after every test"""
        pass

    def test_homepage_header(self):
        """Tests header on homepage"""

        result = self.client.get("/")
        self.assertIn("Novel Idea", result.data)

    def test_homepage_book_link(self):
        """Tests link to all_books on homepage"""

        result = self.client.get("/")
        self.assertIn("View all books", result.data)


class FlaskTestsLoggedInDatabase(unittest.TestCase):
    """Flask tests that use the database and the session"""

    def setUp(self):
        """Things to do before every test"""

        self.client = app.test_client()
        app.config["TESTING"] = True
        app.config["SECRET_KEY"] = "ABC"

        with self.client as c:
            with c.session_transaction() as sess:
                sess['email'] = "slayer@slayer.com"

        # same as saying:
        # sess = self.client.session_transaction()
        # sess['email'] = True

        connect_to_db(app, "postgresql:///testdb")

        db.create_all()
        example_data()
        set_val_user_id()

    def tearDown(self):
        """Things to do after each test"""

        db.session.close()
        db.drop_all()

    def test_books_page(self):
        """Tests all_books page"""

        result = self.client.get("/books")
        #test that sample book is on page and that search feature is appearing
        self.assertIn("Search for a book title", result.data)
        self.assertIn("The Council of Watchers", result.data)

    def test_user_page(self):
        """Tests all_users page"""

        result = self.client.get("/users")
        self.assertIn("Users", result.data)

    def test_genre_page(self):
        """Tests all_genres page"""

        result = self.client.get("/genres")
        self.assertIn("Genres", result.data)

    def test_user_page_not_logged_in(self):
        """Tests redirection to the homepage from a user page if user is not logged in"""

        result = self.client.get("/users/2", follow_redirects=True)
        self.assertIn("Sorry, you must log in to your account to view user details.", result.data)
        #log in buffy in setup, just check other user not able to access

    def test_reviews_page(self):
        """Tests reviews_page"""

        result = self.client.get("/reviews")
        self.assertIn("Reviews", result.data)

    def test_new_registration(self):
        """Tests adding a new user to the db"""

        result = self.client.post("/register",
                                data={"name": "Willow Rosenberg", "email": "wilhacks@aol.com",
                                    "password": "boyinaband"}, follow_redirects=True)
        self.assertIn("You have been registered and logged in! Yay!", result.data)
        user = User.query.filter(User.email == "wilhacks@aol.com").first()
        self.assertIsNotNone(user)

    def test_duplicate_registration(self):
        """Tests using the email of an already existing user"""

        result = self.client.post("/register",
                                data={"name": "Kendra", "email": "slayer@slayer.com",
                                    "password": "me_only_shirt"}, follow_redirects=True)
        self.assertIn("Please try again with a different email.", result.data)
        any_duplicate_users = User.query.filter(User.email == "slayer@slayer.com").all()
        self.assertEqual(len(any_duplicate_users), 1)

    def test_log_in_wrong(self):
        """Tests notification if user mistypes email or password"""

        result = self.client.post("/login",
                                data={"email": "slayer@slayer.com", "password": "me_only_shirt"},
                                follow_redirects=True)
        self.assertNotIn("Welcome Buffy Summers!", result.data)
        self.assertIn("Login failed. Email or password was not correct.", result.data)

    def test_log_in_right(self):
        """Tests notification of a successful login"""

        result = self.client.post("/login",
                                data={"email": "slayer@slayer.com", "password": "bangel4eva97"},
                                follow_redirects=True)
        self.assertIn("Welcome Buffy Summers!", result.data)
        self.assertNotIn("Login failed. Email or password was not correct.", result.data)

        with self.client as c:
            with c.session_transaction() as sess:
                self.assertEqual(sess['email'], "slayer@slayer.com")

    def test_log_out(self):
        """Tests logging out"""

        results = self.client.get("/logout", follow_redirects=True)

        self.assertIn("You are logged out", results.data)

    def test_generate_colors(self):
        """Tests color generating helper function"""

        self.assertIn("rgba", generate_colors())
        #put this in helper function section


if __name__ == '__main__':
    unittest.main()
