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
end
