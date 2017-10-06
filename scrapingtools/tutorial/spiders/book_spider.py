import scrapy


class BookSpider(scrapy.Spider):
    name = "books"

    # start at the url for the list of 'Books With a Goodreads Average Rating of Over 4.5'
    def start_requests(self):
        start_urls = [
            'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=1',
            'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=2',
            'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=3',
            'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=4',
            'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=5',
            'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=6',
            'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=7',
            'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=8'
        ]

        for url in start_urls:
            yield scrapy.Request(url=url, callback=self.parse_main_page)

    # # yield a list of respectively all the titles, all the authors, all the ratings, and all the picture urls on the main page
    def parse_main_page(self, response):
    #     yield {
    #         'titles': response.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "bookTitle", " " ))]//span/text()').extract(),
    #         'authors': response.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "authorName", " " ))]//span/text()').extract(),
    #         'ratings': response.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "minirating", " " ))]/text()').extract(),
    #         'pics': response.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "bookSmallImg", " " ))]/@src').extract()
    #     }

        #make a list of urls to book pages
        book_pages = response.css('a.bookTitle::attr(href)').extract()

        #follow each link to the individual book page and call the function parse_book_page
        for book_page in book_pages:
            if book_page is not None:
                yield response.follow(book_page, callback=self.parse_book_page)

    #yield a list of the book attributes
    def parse_book_page(self, response):
        yield {
            'title': response.xpath('//*[(@id = "bookTitle")]/text()').extract_first(),
            'author': response.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "authorName", " " )) and (((count(preceding-sibling::*) + 1) = 1) and parent::*)]//span/text()').extract_first(),
            'rating': response.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "average", " " ))]/text()').extract_first(),
            'pic_url': response.xpath('//*[(@id = "coverImage")]/@src').extract_first(),
            'genres': response.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "left", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "bookPageGenreLink", " " ))]/text()').extract()
        }