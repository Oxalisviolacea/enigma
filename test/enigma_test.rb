require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt_a_message
    expected = {encryption: "whxttuawn ukrwftioptmueiv gohrsmkesedzqtgoz.",
                key: "2715",
                date: "40895"}
    assert_equal expected, @enigma.encrypt(
      "The quick brown fox jumps over the lazy dog.", "2715", "40895")
  end

  def test_it_can_decrypt_a_message
    expected = {decryption: "The quick brown fox jumps over the lazy dog.",
                key: "2715",
                date: "40895"}
    assert_equal expected, @enigma.decrypt(
      "whxttuawn ukrwftioptmueiv gohrsmkesedzqtgoz.", "2715", "40895")
  end
end
