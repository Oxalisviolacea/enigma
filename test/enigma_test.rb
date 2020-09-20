require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_read_the_message_file
    assert_equal "The quick brown fox jumps over the lazy dog.", @enigma.message
  end

  def test_it_can_write_to_the_encrpted_file
    assert_equal "whxttuawn ukrwftioptmueiv gohrsmkesedzqtgoz", @enigma.ciphertext
  end
end
