require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    load_standard_test_data
  end

  test "num_ratings"  do
    Book.find_each do |b|
      assert_equal b.ratings.count, b.num_ratings, "num_ratings should return ratings.count"
    end
  end

  test "average_rating" do
    assert_in_delta 2.333, @enders_game.average_rating, 0.001, "average_rating should return 2.333 for Ender's Game"
    assert_nil @five_pigs.average_rating, "average_rating should return nil for Five Pigs"
  end

  test "fans" do
    assert_kind_of Enumerable, @enders_game.fans, "@enders_game.fans should be a kind of Enumerable"
    assert_includes @enders_game.fans, @bob, "Bob should be a fan of Ender's Game"
    assert_equal 1, @enders_game.fans.count, "There should be only 1 fan of Ender's Game"
    Rating.create( user: @sue, book: @book_1984, rating: 5 )
    assert_kind_of Enumerable, @book_1984.fans, "@book_1984.fans should be a kind of Enumerable"
    assert_includes @book_1984.fans, @mary, "Mary should be a fan of 1984."
    assert_includes @book_1984.fans, @sue, "If Sue also rates 1984 a 5, Sue should be a fan of 1984."
    assert_equal 2, @book_1984.fans.count, "If Sue also rates 1984 a 5, there should be 2 fans of 1984."
    assert_kind_of Enumerable, @catching_fire.fans, "@catching_fire.fans should be a kind of Enumerable"
    assert_equal 0, @catching_fire.fans.count, "There should be 0 fans of Catching Fire."
  end

  def test_to_s 
    Book.find_each do |b|
      assert_equal "#{b.title}, by #{b.author}, (#{b.year})", b.to_s
    end
  end
  

end
