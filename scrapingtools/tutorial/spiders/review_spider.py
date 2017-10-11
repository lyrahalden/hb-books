import scrapy


class ReviewSpider(scrapy.Spider):
    name = "reviews"

    # start at the url for the list of 'Books With a Goodreads Average Rating of Over 4.5'
    def start_requests(self):
        start_urls = [
            'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=1'
            # 'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=2',
            # 'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=3',
            # 'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=4',
            # 'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=5',
            # 'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=6',
            # 'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=7',
            # 'https://www.goodreads.com/list/show/24320.Books_With_a_Goodreads_Average_Rating_of_4_2_and_Above?page=8'
        ]

        for url in start_urls:
            yield scrapy.Request(url=url, callback=self.parse_main_page)

    def parse_main_page(self, response):

        #make a list of urls to book pages
        book_pages = response.css('a.bookTitle::attr(href)').extract()

        #follow each link to the individual book page and call the function parse_book_page
        for book_page in book_pages:
            if book_page is not None:
                yield response.follow(book_page, callback=self.parse_book_page)

    #yield a list of the book attributes
    def parse_book_page(self, response):

        #make a list of links to the page for each review
        review_links = response.xpath('//*[(@id = "bookReviews")]//*[contains(concat( " ", @class, " " ), concat( " ", "createdAt", " " ))]/@href').extract()


        # follow each link to its review page and call parse_review_page for each one
        for link in review_links:
            if link is not None:
                yield response.follow(link, callback=self.parse_review_page)


    #yield a list with each review's score and text, as well as the title of the book
    def parse_review_page(self, response):

        yield {
            'score': response.xpath('/html/body/div[1]/div[2]/div[1]/div[1]/div[3]/div[2]/div/div/div[1]/div/div[1]/div[3]/span[1]/@title').extract_first(),
            #like the summary text above, the review text is also broken up into sections, so it must be scraped into a list
            'text_blocks': response.css('.readable::text').extract(),
            'title': response.css('.bookTitle::text').extract_first()
            }
