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

  def test_it_can_create_a_hash_of_offsets
    @enigma.stubs(:date).returns(40895)

    expected = ({"A" => 1, "B" => 0, "C" => 2, "D" => 5})
    assert_equal expected, @enigma.offset_hash
  end

  def test_it_can_merge_the_keys_and_offsets_hashes
    @enigma.stubs(:random_number).returns(2715)
    @enigma.stubs(:date).returns(40895)

    expected = ({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
    assert_equal expected, @enigma.merge_keys_and_offsets
  end

  def test_it_can_create_the_letters
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
      "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
      "y", "z", " "]
      assert_equal expected, @enigma.alphabet
  end
end
