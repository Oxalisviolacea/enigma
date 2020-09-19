require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_make_the_keys_into_a_hash
    @enigma.stubs(:random_number).returns(2715)
    expected = ({"A" => 02, "B" => 27, "C" => 71, "D" => 15})
    assert_equal expected, @enigma.key_hash
  end

  def test_it_can_square_the_date
    @enigma.stubs(:date).returns(40895)
    assert_equal 1672401025, @enigma.offset_squared
  end
end
