require_relative 'book'
## Inventory functionality helpers
module InventoryApp
  include Book
  # freeze values so that they are not able to mutate, makes them constant
  PROMPT = "Options:\n\t1. Add A Book\n\t2. Search Books".freeze
  DIVIDER = '------------------------------------------'.freeze
  def self.new_book
    puts DIVIDER
    puts 'New Book'
    puts 'Title:'
    title = gets
    puts 'Author:'
    author = gets
    puts "Genre #{Book.genre}"
    genre = gets
    Book.new(title, author, genre)
  end

  # search through an array for a book
  def self.book_search(books)
    puts DIVIDER
    puts "Search by field\n\t1. Title\n\t2. Author\n\t3. Fiction/Nonfiction"
    option = gets
    if option == "1\n"
      Book::search_by_title(books)
    elsif option == "2\n"
      Book::search_by_author(books)
    elsif option == "3\n"
      Book::search_by_genre(books)
    end

    books
  end

  # main inventory app loop
  def self.start
    # our in memory database for our books
    books = []
    # create a while loop with options
    should_show_menu = true
    while should_show_menu
      # show options
      puts InventoryApp::PROMPT
      # get user input
      option = gets
      if option == "1\n"
        # get user input to push a new book onto the array
        book = InventoryApp::new_book
        books.push(book)
      elsif option == "2\n"
        # get user input to query books array
        search_results = book_search(books)
        # for each object in the array print them out pretty
        search_results.each {|book| book.pretty_print }
      end
    end
  end
end
# start the app
InventoryApp.start
