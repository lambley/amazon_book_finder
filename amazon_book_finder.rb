require 'csv'
require 'open-uri'

# Find book on amazon from file of isbns, then retrieve price and availability information
# Optional functionality - could scrape ISBNs from another site to feed to this module
class AmazonBookFinder
  attr_reader :isbns

  def initialize
    @input = nil # => filename string
    @isbns = nil # => isbns array
    @urls = nil # => urls array
  end

  def import_isbns
    # import csv file to array
    # NOTE: should only be one file in the book_files that matches - move to archive after use.
    @input = Dir.glob('book_files/isbn*.csv')[0]
    @isbns = CSV.read(@input).flatten

    # check if isbns are 10 or 13 chars - if 13, pass to isbn 13 to 10 converter method
    @isbns = isbn13_to_isbn10(@isbns) if contains_isbn13s?(@isbns)
  end

  def isbn13_to_isbn10(isbns)
    # given an array of isbn 13s, map each isbn 13 to isbn 10 and return array
    isbns.map do |isbn|
      if isbn.size == 13
        isbn13 = isbn[3..11]
        sum = 0
        (0..8).each { |index| sum += isbn13[index].chr.to_i * (10 - index) }
        check = (11 - sum) % 11 == 10 ? 'X' : ((11 - sum) % 11).to_s
        "#{isbn13}#{check}"
      else
        isbn
      end
    end
  end

  def contains_isbn13s?(isbns)
    # TODO: given an array of isbns, check if any are isbn 13 and if so return true
    check = false
    isbns.each do |isbn|
      check = true if isbn.size == 13
    end
    check
  end

  def archive_file(filename)
    archive_name = filename.split('/').insert(1, '/archive/').join
    File.rename filename, archive_name
  end

  # TODO: scrape www.amazon.co.uk/dp/isbn_10 for price and availability info
  # TODO: export scrape data to file in output
end
