require "csv"
require "open-uri"

module AmazonBookFinder
  # main module
  # Optional functionality - could scrape ISBNs from another site to feed to this module

  def import_isbns
    # TODO: look in book_files folder for .csv or .txt files
    # TODO: check if isbns are 10 or 13 chars - if 13, pass to isbn 13 to 10 converter method
    # TODO: archive import file to book_files/archive
    # TODO: export isbn 10s to
  end

  def isbn_13_to_10(isbns)
    # TODO: given an array of isbn 13s, map each
  end
  # TODO: import isbns from book_files folder
  # TODO:
  # TODO: export found data to output folder

end
