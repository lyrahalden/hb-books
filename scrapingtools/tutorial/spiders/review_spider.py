import scrapy


class ReviewSpider(scrapy.Spider):
    name = "reviews"
    start_urls = [
        'https://www.goodreads.com/review/show/38209515?book_show_action=true&from_review_page=1'
    ]

    def parse(self, response):
            yield {
                'review': response.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "readable", " " ))]/text()').extract(),
            }
        #next_page = response.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "updateActionLinks", " " ))]//a+//a')
        # next_page = response.css('li.next a::attr(href)').extract_first()
        # if next_page is not None:
        #     next_page = response.urljoin(next_page)
        #     yield scrapy.Request(next_page, callback=self.parse)