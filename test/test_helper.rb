ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
#  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
#  fixtures :all

  # Add more helper methods to be used by all tests here...

  def load_standard_test_data
    @card = Author.create( name: "Orson Scott Card")
    @collins = Author.create( name: "Suzanne Collins")
    @orwell = Author.create( name: "George Orwell")
    @twain = Author.create( name: "Mark Twain")
    @christie = Author.create( name: "Agatha Christie")

    @enders_game = Book.new( title: "Ender's Game", year: 1985 )
    @enders_game.author = @card
    @enders_game.save

    @hunger_games = Book.new( title: "The Hunger Games", year: 2008)
    @hunger_games.author = @collins
    @hunger_games.save

    @book_1984 = Book.new( title: "1984", year: 1949 )
    @book_1984.author = @orwell
    @book_1984.save

    @catching_fire = Book.new( title: "Catching Fire", year: 2009 )
    @catching_fire.author = @collins
    @catching_fire.save

    @five_pigs = Book.new( title:"Five Little Pigs", year:1942 )
    @five_pigs.author = @christie
    @five_pigs.save

    @bob  = User.create( name: "Bob",  email: "bob@bob.com")
    @mary = User.create( name: "Mary", email: "mary@mary.com")
    @sue  = User.create( name: "Sue",  email: "sue@sue.com")
    @fred = User.create( name: "Fred", email: "fred@fred.com")

    r1 = Rating.create( user: @bob,  book: @enders_game, rating: 5)
    r2 = Rating.create( user: @bob,  book: @book_1984, rating: -3)
    r3 = Rating.create( user: @mary, book: @catching_fire, rating: 3)
    r4 = Rating.create( user: @mary, book: @book_1984, rating: 5 )
    r5 = Rating.create( user: @sue, book: @enders_game, rating: 4)
    r6 = Rating.create( user: @mary, book: @enders_game, rating: -2)
    r7 = Rating.create( user: @sue, book: @hunger_games, rating: 5)

    @rl1 = @bob.readinglists.create(name: "Hungry to Read")
    @rl1.books << @hunger_games
    @rl1.books << @catching_fire

    rl2 = @sue.readinglists.create( name: "Gotta Read")
    rl2.books << @book_1984
    rl2.books << @enders_game

    rl3 = @fred.readinglists.create( name: "Sue Recommends")
    rl3.books << @hunger_games
  end


end
