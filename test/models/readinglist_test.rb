require "test_helper"

class ReadinglistTest < ActiveSupport::TestCase

  def setup
    load_standard_test_data
  end

  def test_to_s
    # https://stackoverflow.com/questions/4662015/ruby-reduce-all-whitespace-to-single-spaces/40261225
    
    bob_list = @rl1

    bob_to_s_expected = <<HHHHHHH
Bob's list named "Hungry to Read" has books:
-> The Hunger Games, by Suzanne Collins, (2008)
-> Catching Fire, by Suzanne Collins, (2009)
HHHHHHH

    actual = bob_list.to_s.gsub(/\s+/, ' ').strip
    expected = bob_to_s_expected.gsub(/\s+/, ' ').strip

    assert_equal expected, actual
  end

end
