# Example of a class
## A Book implementation
class Book
  # make a public property for the book genre
  attr_accessor :genre
  # makes title and author private properties through accessors
  attr_reader :title, :author

  # New Book initializer Book(title, body)
  def initialize(title, author, genre)
    # Set the properties
    @title = title
    @author = author
    @genre = genre
  end

  # public member function to print a pretty interperitation of a book
  def pretty_print
    puts "#{title} written by #{author}"
  end

  # a private function to get all available genres
  def self.genre
    ['Fiction', 'Nonfiction']
  end

  def self.search_by_title(books)
    
  end
end
