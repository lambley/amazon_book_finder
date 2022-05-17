require 'open-uri'
require 'nokogiri'
require 'csv'

BESTSELLERS = 'https://www.waterstones.com/books/bestsellers'.freeze

def waterstones_scraper
  # get html from bestsellers page
  html_content = Nokogiri::HTML(URI.parse(BESTSELLERS).open)
  html_content = html_content.search('.title-wrap a')

  # get array of urls from bestsellers page
  urls = html_content.map { |url| "https://www.waterstones.com#{url.attributes['href'].value}"}

  # with array of urls, strip last 13 digits for isbn13s
  isbns = urls.map { |isbn| isbn.chars.last(13).join }
  p isbns

  # write isbns to csv
  output_csv(isbns, 'isbn')

  # write urls to csv
  output_csv(urls, 'url')
end

def output_csv(array, name)
  CSV.open("book_files/#{name}_#{Time.now.strftime('%Y%m%d_%H%M%S')}.csv", 'wb') do |row|
    array.each do |element|
      row << [element]
    end
  end
end
