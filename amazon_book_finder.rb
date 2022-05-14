require 'csv'
require 'open-uri'

# Find book on amazon from file of isbns, then retrieve price and availability information
# Optional functionality - could scrape ISBNs from another site to feed to this module
module AmazonBookFinder
  def import_isbns
    # TODO: look in book_files folder for .csv or .txt files
    # TODO: check if isbns are 10 or 13 chars - if 13, pass to isbn 13 to 10 converter method
    # TODO: archive import file to book_files/archive
    # TODO: scrape www.amazon.co.uk/dp/isbn_10 for price and availability info
    # TODO: export scrape data to file in output
  end

  def isbn13_to_isbn10(isbns)
    # TODO: given an array of isbn 13s, map each isbn 13 to isbn 10 and return array
  end
end
