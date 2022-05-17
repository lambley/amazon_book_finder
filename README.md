# Amazon Book Finder

Amazon Book Finder is a Ruby file that finds amazon pages from a given list of ISBN-10 or ISBN-13 (in .csv or .txt files), retrieves current price and availability and stores information to an output file.

## Future Developments

Add methods to scrape ISBNs from another publishers website and export to book_files folder for amazon_book_finder to use

Refactor using MVC model
- __Model__: `AmazonBookFinder`
- __View__: need to make `View` file
- __Controller__: need to make `Controller` file
- __Router__: at the moment, built into `WaterstonesScraper`
- __Database__: `WaterstonesScraper`
