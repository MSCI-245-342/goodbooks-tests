require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    load_standard_test_data
  end

  test "favorite_books" do
    assert_kind_of Enumerable, @bob.favorite_books, "Bob's favorite_books should be a kind of Enumberable"
    assert_includes @bob.favorite_books, @enders_game, "Bob's favorites include Enders Game"
    assert_equal 1, @bob.favorite_books.count, "Bob should only have 1 favorite book"

    assert_kind_of Enumerable, @fred.favorite_books, "Fred's favorite_books should be a kind of Enumberable"
    assert_equal 0, @fred.favorite_books.count, "Fred should have 0 favorite books"
    r = Rating.create( user: @fred, book: @enders_game, rating: 0 )
    assert_equal 0, @fred.favorite_books.count, "If Fred rates Enders=0, then Fred should still have 0 favorite books"
    r.destroy

    Rating.create( user: @fred, book: @enders_game, rating: 3 )
    Rating.create( user: @fred, book: @book_1984, rating: 3 )
    Rating.create( user: @fred, book: @hunger_games, rating: 2 )
    assert_includes @fred.favorite_books, @enders_game, 
      "Assume Fred rated Enders=3, 1984=3, Hunger=2, then Enders should be a favorite"
    assert_includes @fred.favorite_books, @book_1984,
      "Assume Fred rated Enders=3, 1984=3, Hunger=2, then 1984 should be a favorite"
    assert_equal 2, @fred.favorite_books.count,
      "Assume Fred rated Enders=3, 1984=3, Hunger=2, then Fred should only have 2 favorites"

    assert_kind_of Enumerable, @mary.favorite_books, "Mary's favorite_books should be a kind of Enumerable"
    assert_includes @mary.favorite_books, @book_1984, "Mary should have 1984 as a favorite"
    assert_equal 1,  @mary.favorite_books.count, "Mary should have only 1 favorite"
    Rating.create( user: @mary, book: @five_pigs, rating: 5 )
    assert_includes @mary.favorite_books, @book_1984, "If Mary also rated FivePigs=5, then 1984 is still a favorite"
    assert_includes @mary.favorite_books, @five_pigs, "If Mary also rated FivePigs=5, then FivePigs is a favorite"
    assert_equal 2,  @mary.favorite_books.count, "If Mary also rated FivePigs=5, then she should only have 2 favorites"
 
    assert_kind_of Enumerable, @sue.favorite_books, "Sue's favorite_books should be a kind of Enumerable"
    assert_includes @sue.favorite_books, @hunger_games, "Sue should have HungerGames as a favorite"
    assert_equal 1, @sue.favorite_books.count, "Sue should only have 1 favorite book"
  end

  test "books_in_common" do
    assert_kind_of Enumerable, @bob.books_in_common(@sue.id), "@bob.books_in_common(@sue.id) should be a kind of Enumerable"
    assert_includes @bob.books_in_common( @sue.id ), @enders_game, "Bob and Sue should have Enders Game in common"
    assert_equal 1, @bob.books_in_common( @sue.id ).count, "Bob should have 1 book in common with Sue"

    assert_kind_of Enumerable, @mary.books_in_common(@sue.id), "@mary.books_in_common(@sue.id) should be a kind of Enumerable"
    assert_kind_of Enumerable, @sue.books_in_common(@mary.id), "@sue.books_in_common(@mary.id) should be a kind of Enumerable"
    assert_equal 0, @mary.books_in_common( @sue.id ).count, "Mary and Sue should have no books in common"
    assert_equal 0, @sue.books_in_common( @mary.id ).count, "Sue and Mary should have no books in common"
    
    assert_includes @mary.books_in_common( @mary.id ), @catching_fire, 
      "Mary should have Catching Fire and 1984 in common with herself"
    assert_includes @mary.books_in_common( @mary.id ), @book_1984,
      "Mary should have Catching Fire and 1984 in common with herself"
    assert_equal 2, @mary.books_in_common( @mary.id ).count, "Mary should have only 2 books in common with herself"
  end

  def test_to_s

  end

end
