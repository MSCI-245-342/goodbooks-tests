require "test_helper"

class RatingTest < ActiveSupport::TestCase

  def setup
    load_standard_test_data
  end

  def test_to_s
    Rating.find_each do |r|
      assert_equal "#{r.user.name} rated \"#{r.book.title}\" a #{r.rating}.", r.to_s
    end
  end

end
