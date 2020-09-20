require './test/test_helper'

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
    assert_equal expected, @enigma.keys_and_offsets
  end

  def test_it_can_format_input
    @enigma.stubs(:input).returns("The quick brown fox jumps over the lazy dog.")
    expected = ["t", "h", "e", " ", "q", "u", "i", "c", "k", " ", "b", "r",
      "o", "w", "n", " ", "f", "o", "x", " ", "j", "u", "m", "p", "s", " ", "o",
      "v", "e", "r", " ", "t", "h", "e", " ", "l", "a", "z", "y", " ", "d",
      "o", "g"]
    assert_equal expected, @enigma.format_input
  end

  def test_it_can_find_the_index_of_the_input
    expected = [["t", 0, 0], ["h", 1, 1], ["e", 2, 2], [" ", 3, 3],
    ["q", 4, 0], ["u", 5, 1], ["i", 6, 2], ["c", 7, 3], ["k", 8, 0],
    [" ", 9, 1], ["b", 10, 2], ["r", 11, 3], ["o", 12, 0], ["w", 13, 1],
    ["n", 14, 2], [" ", 15, 3], ["f", 16, 0], ["o", 17, 1], ["x", 18, 2],
    [" ", 19, 3], ["j", 20, 0], ["u", 21, 1], ["m", 22, 2], ["p", 23, 3],
    ["s", 24, 0], [" ", 25, 1], ["o", 26, 2], ["v", 27, 3], ["e", 28, 0],
    ["r", 29, 1], [" ", 30, 2], ["t", 31, 3], ["h", 32, 0], ["e", 33, 1],
    [" ", 34, 2], ["l", 35, 3], ["a", 36, 0], ["z", 37, 1], ["y", 38, 2],
    [" ", 39, 3], ["d", 40, 0], ["o", 41, 1], ["g", 42, 2]]

    assert_equal expected, @enigma.input_index
  end

  def test_it_can_make_an_array_with_the_alphabet
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
                "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
                "y", "z", " "]
    assert_equal expected, @enigma.alphabet
  end

  def test_it_can_create_an_A_shift_hash
    @enigma.stubs(:random_number).returns(2715)
    @enigma.stubs(:date).returns(40895)

    expected = {"a"=>"d", "b"=>"e", "c"=>"f", "d"=>"g", "e"=>"h", "f"=>"i",
      "g"=>"j", "h"=>"k", "i"=>"l", "j"=>"m", "k"=>"n", "l"=>"o", "m"=>"p",
      "n"=>"q", "o"=>"r", "p"=>"s", "q"=>"t", "r"=>"u", "s"=>"v", "t"=>"w",
      "u"=>"x", "v"=>"y", "w"=>"z", "x"=>" ", "y"=>"a", "z"=>"b", " "=>"c"}
    assert_equal expected, @enigma.a_shift
  end

  def test_it_can_create_an_B_shift_hash
    @enigma.stubs(:random_number).returns(2715)
    @enigma.stubs(:date).returns(40895)

    expected = {"a"=>"a", "b"=>"b", "c"=>"c", "d"=>"d", "e"=>"e", "f"=>"f",
      "g"=>"g", "h"=>"h", "i"=>"i", "j"=>"j", "k"=>"k", "l"=>"l", "m"=>"m",
      "n"=>"n", "o"=>"o", "p"=>"p", "q"=>"q", "r"=>"r", "s"=>"s", "t"=>"t",
      "u"=>"u", "v"=>"v", "w"=>"w", "x"=>"x", "y"=>"y", "z"=>"z", " "=>" "}
    assert_equal expected, @enigma.b_shift
  end

  def test_it_can_create_an_C_shift_hash
    @enigma.stubs(:random_number).returns(2715)
    @enigma.stubs(:date).returns(40895)

    expected = {"a"=>"t", "b"=>"u", "c"=>"v", "d"=>"w", "e"=>"x", "f"=>"y",
      "g"=>"z", "h"=>" ", "i"=>"a", "j"=>"b", "k"=>"c", "l"=>"d", "m"=>"e",
      "n"=>"f", "o"=>"g", "p"=>"h", "q"=>"i", "r"=>"j", "s"=>"k", "t"=>"l",
      "u"=>"m", "v"=>"n", "w"=>"o", "x"=>"p", "y"=>"q", "z"=>"r", " "=>"s"}
    assert_equal expected, @enigma.c_shift
  end

  def test_it_can_create_an_D_shift_hash
    @enigma.stubs(:random_number).returns(2715)
    @enigma.stubs(:date).returns(40895)

    expected = {"a"=>"u", "b"=>"v", "c"=>"w", "d"=>"x", "e"=>"y", "f"=>"z",
      "g"=>" ", "h"=>"a", "i"=>"b", "j"=>"c", "k"=>"d", "l"=>"e", "m"=>"f",
      "n"=>"g", "o"=>"h", "p"=>"i", "q"=>"j", "r"=>"k", "s"=>"l", "t"=>"m",
      "u"=>"n", "v"=>"o", "w"=>"p", "x"=>"q", "y"=>"r", "z"=>"s", " "=>"t"}
    assert_equal expected, @enigma.d_shift
  end

  def test_it_can_rotate_the_shift_the_letters
    @enigma.stubs(:random_number).returns(2715)
    @enigma.stubs(:date).returns(40895)

    expected = ["w", "h", "x", "t", "t", "u", "a", "w", "n", " ", "u", "k",
      "r", "w", "f", "t", "i", "o", "p", "t", "m", "u", "e", "i", "v", " ",
      "g", "o", "h", "r", "s", "m", "k", "e", "s", "e", "d", "z", "q", "t",
      "g", "o", "z"]

    assert_equal expected, @enigma.shift
  end

  def test_it_can_join_the_shift
    @enigma.stubs(:random_number).returns(2715)
    @enigma.stubs(:date).returns(40895)

    expected = "whxttuawn ukrwftioptmueiv gohrsmkesedzqtgoz"

    assert_equal expected, @enigma.join_shift
  end
end
