require './test/test_helper'

class DecryptTest < Minitest::Test
  def setup
    @decrypt = Decrypt.new("whxttuawn ukrwftioptmueiv gohrsmkesedzqtgoz.", "2715", "40895")
  end

  def test_it_exists
    assert_instance_of Decrypt, @decrypt
  end

  def test_it_has_attributes
    assert_equal "whxttuawn ukrwftioptmueiv gohrsmkesedzqtgoz.", @decrypt.ciphertext
    assert_equal "2715", @decrypt.key
    assert_equal "40895", @decrypt.date
  end

  def test_it_can_make_the_keys_into_a_hash
    expected = ({"A" => 02, "B" => 27, "C" => 71, "D" => 15})
    assert_equal expected, @decrypt.key_hash
  end

  def test_it_can_square_the_date
    assert_equal 1672401025, @decrypt.offset_squared
  end

  def test_it_can_create_a_hash_of_offsets
    expected = ({"A" => 1, "B" => 0, "C" => 2, "D" => 5})
    assert_equal expected, @decrypt.offset_hash
  end

  def test_it_can_merge_the_keys_and_offsets_hashes
    expected = ({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
    assert_equal expected, @decrypt.keys_and_offsets
  end

  def test_it_can_format_input
    expected = ["w", "h", "x", "t", "t", "u", "a", "w", "n", " ", "u", "k",
      "r", "w", "f", "t", "i", "o", "p", "t", "m", "u", "e", "i", "v", " ",
      "g", "o", "h", "r", "s", "m", "k", "e", "s", "e", "d", "z", "q", "t",
      "g", "o", "z", "."]
    assert_equal expected, @decrypt.format_input
  end

  def test_it_can_find_the_index_of_the_input
    expected = [["w", 0, 0], ["h", 1, 1], ["x", 2, 2], ["t", 3, 3],
    ["t", 4, 0], ["u", 5, 1], ["a", 6, 2], ["w", 7, 3], ["n", 8, 0],
    [" ", 9, 1], ["u", 10, 2], ["k", 11, 3], ["r", 12, 0], ["w", 13, 1],
    ["f", 14, 2], ["t", 15, 3], ["i", 16, 0], ["o", 17, 1], ["p", 18, 2],
    ["t", 19, 3], ["m", 20, 0], ["u", 21, 1], ["e", 22, 2], ["i", 23, 3],
    ["v", 24, 0], [" ", 25, 1], ["g", 26, 2], ["o", 27, 3], ["h", 28, 0],
    ["r", 29, 1], ["s", 30, 2], ["m", 31, 3], ["k", 32, 0], ["e", 33, 1],
    ["s", 34, 2], ["e", 35, 3], ["d", 36, 0], ["z", 37, 1], ["q", 38, 2],
    ["t", 39, 3], ["g", 40, 0], ["o", 41, 1], ["z", 42, 2], [".", 43, 3]]
    assert_equal expected, @decrypt.input_index
  end

  def test_it_can_find_all_special_characters
    expected = [[".", 43, 3]]
    assert_equal expected, @decrypt.find_special_chars
  end

  def test_it_make_an_array_without_special_chars
    expected = [["w", 0, 0], ["h", 1, 1], ["x", 2, 2], ["t", 3, 3],
    ["t", 4, 0], ["u", 5, 1], ["a", 6, 2], ["w", 7, 3], ["n", 8, 0],
    [" ", 9, 1], ["u", 10, 2], ["k", 11, 3], ["r", 12, 0], ["w", 13, 1],
    ["f", 14, 2], ["t", 15, 3], ["i", 16, 0], ["o", 17, 1], ["p", 18, 2],
    ["t", 19, 3], ["m", 20, 0], ["u", 21, 1], ["e", 22, 2], ["i", 23, 3],
    ["v", 24, 0], [" ", 25, 1], ["g", 26, 2], ["o", 27, 3], ["h", 28, 0],
    ["r", 29, 1], ["s", 30, 2], ["m", 31, 3], ["k", 32, 0], ["e", 33, 1],
    ["s", 34, 2], ["e", 35, 3], ["d", 36, 0], ["z", 37, 1], ["q", 38, 2],
    ["t", 39, 3], ["g", 40, 0], ["o", 41, 1], ["z", 42, 2]]
    assert_equal expected, @decrypt.array_without_special_chars
  end

  def test_it_can_make_an_array_with_the_alphabet
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
      "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
      "y", "z", " "]
      assert_equal expected, @decrypt.alphabet
  end

  def test_it_can_create_an_A_shift_hash
    expected = {"d"=>"a", "e"=>"b", "f"=>"c", "g"=>"d", "h"=>"e", "i"=>"f",
      "j"=>"g", "k"=>"h", "l"=>"i", "m"=>"j", "n"=>"k", "o"=>"l", "p"=>"m",
      "q"=>"n", "r"=>"o", "s"=>"p", "t"=>"q", "u"=>"r", "v"=>"s", "w"=>"t",
      "x"=>"u", "y"=>"v", "z"=>"w", " "=>"x", "a"=>"y", "b"=>"z", "c"=>" "}
    assert_equal expected, @decrypt.a_shift
  end

  def test_it_can_create_an_B_shift_hash
    expected = {"a"=>"a", "b"=>"b", "c"=>"c", "d"=>"d", "e"=>"e", "f"=>"f",
      "g"=>"g", "h"=>"h", "i"=>"i", "j"=>"j", "k"=>"k", "l"=>"l", "m"=>"m",
      "n"=>"n", "o"=>"o", "p"=>"p", "q"=>"q", "r"=>"r", "s"=>"s", "t"=>"t",
      "u"=>"u", "v"=>"v", "w"=>"w", "x"=>"x", "y"=>"y", "z"=>"z", " "=>" "}
    assert_equal expected, @decrypt.b_shift
  end

  def test_it_can_create_an_C_shift_hash
    expected = {"t"=>"a", "u"=>"b", "v"=>"c", "w"=>"d", "x"=>"e", "y"=>"f",
      "z"=>"g", " "=>"h", "a"=>"i", "b"=>"j", "c"=>"k", "d"=>"l", "e"=>"m",
      "f"=>"n", "g"=>"o", "h"=>"p", "i"=>"q", "j"=>"r", "k"=>"s", "l"=>"t",
      "m"=>"u", "n"=>"v", "o"=>"w", "p"=>"x", "q"=>"y", "r"=>"z", "s"=>" "}
    assert_equal expected, @decrypt.c_shift
  end

  def test_it_can_create_an_D_shift_hash
    expected = {"u"=>"a", "v"=>"b", "w"=>"c", "x"=>"d", "y"=>"e", "z"=>"f",
      " "=>"g", "a"=>"h", "b"=>"i", "c"=>"j", "d"=>"k", "e"=>"l", "f"=>"m",
      "g"=>"n", "h"=>"o", "i"=>"p", "j"=>"q", "k"=>"r", "l"=>"s", "m"=>"t",
      "n"=>"u", "o"=>"v", "p"=>"w", "q"=>"x", "r"=>"y", "s"=>"z", "t"=>" "}
    assert_equal expected, @decrypt.d_shift
  end

  def test_it_can_rotate_the_shift_the_letters
    expected = ["t", "h", "e", " ", "q", "u", "i", "c", "k", " ", "b", "r",
      "o", "w", "n", " ", "f", "o", "x", " ", "j", "u", "m", "p", "s", " ", "o",
      "v", "e", "r", " ", "t", "h", "e", " ", "l", "a", "z", "y", " ", "d",
      "o", "g"]

    assert_equal expected, @decrypt.shift
  end
end
