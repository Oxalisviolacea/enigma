require 'date'

class Enigma
  def initialize
    @input = "The quick brown fox jumps over the lazy dog."
  end

  def random_number
    rand(99999)
  end

  def key_hash
    rand_str = random_number.to_s.rjust(5, '0')
    number_str_array = [rand_str[0..1], rand_str[1..2], rand_str[2..3], rand_str[3..4]]
    number_array = number_str_array.map {|number| number.to_i}
    letter_array = ("A".."D").to_a
    Hash[letter_array.zip(number_array)]
  end
end
