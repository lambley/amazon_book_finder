require 'open-uri'
require 'nokogiri'
require 'csv'

BESTSELLERS = 'https://www.waterstones.com/books/bestsellers'.freeze

# Handle scraping bestsellers pages of www.waterstones.com. Creates output files.
class WaterstonesIsbnScraper
  def initialize
    @doc = nil
    @isbns = nil
    @urls = nil
  end

  def run
    # get html from bestsellers page
    html = Nokogiri::HTML(URI.parse(BESTSELLERS).open)
    @doc = html.search('.title-wrap a')

    # get array of urls from bestsellers page
    @urls = url_mapping(@doc)

    # with array of urls, strip last 13 digits for isbn13s
    @isbns = isbn_mapping(@urls)

    # write isbns to csv
    output_csv(@isbns, 'isbn')

    # write urls to csv
    output_csv(@urls, 'url')
  end

  def url_mapping(doc)
    # strip urls from doc
    doc.map { |url| "https://www.waterstones.com#{url.attributes['href'].value}" }
  end

  def isbn_mapping(urls)
    # strip isbns from urls
    urls.map { |isbn| isbn.chars.last(13).join }
  end

  def output_csv(array, name)
    # for outputting urls and isbns to .csv
    CSV.open("book_files/#{name}_#{Time.now.strftime('%Y%m%d_%H%M%S')}.csv", 'wb') do |row|
      array.each do |element|
        row << [element]
      end
    end
  end
end
