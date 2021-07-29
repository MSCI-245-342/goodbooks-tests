require "test_helper"

class AuthorTest < ActiveSupport::TestCase

  def setup
    load_standard_test_data
  end


  # Add a method named most_liked_book to the Author model that returns a 
  # Book object for the author's book with the highest average rating. 
  # If an author has no books rated, return nil. If multiple books have the 
  # same highest average rating, the book with more ratings should be returned. 
  # If more than one book has the same highest average rating and the same 
  # number of ratings, then of these books, the book with the lowest id is returned.
  test "most_liked_book" do
    assert_equal @hunger_games, @collins.most_liked_book, "Collin's most liked book should be Hunger Games"
    assert_nil @christie.most_liked_book, "Christie should have no most liked book and should return nil"

    Rating.create( user: @bob, book: @hunger_games, rating: 0) 
    assert_equal @catching_fire, @collins.most_liked_book,
      "If we add rating of Hunger=0, then Catching should become the most liked book for Collins"

    Rating.create( user: @fred, book: @hunger_games, rating: 4) 
    # next two asserts are sanity checks for test validity
    assert_in_delta 3, Rating.where(book_id: @hunger_games.id).average(:rating)
    assert_in_delta 3, Rating.where(book_id: @catching_fire.id).average(:rating)
    assert @hunger_games.id < @catching_fire.id
    assert_equal @hunger_games, @collins.most_liked_book, 
      "If we add ratings of 0 and 4 for hunger games, its avg rating equals Catching, but it is the most liked book with a lower id."
  end

  def test_to_s
    Author.find_each do |a|
      assert_equal "#{a.name}", a.to_s
    end
  end


end
