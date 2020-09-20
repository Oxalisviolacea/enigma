require 'date'

class Enigma
  attr_reader :input
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

  def date
    Date.today.strftime("%m%d%y").to_i
  end

  def offset_squared
    date ** 2
  end

  def offset_hash
    number_str_array = offset_squared.to_s[-4..-1].split("")
    number_array = number_str_array.map {|number| number.to_i}
    letter_array = ("A".. "D").to_a
    Hash[letter_array.zip(number_array)]
  end

  def keys_and_offsets
    key_hash.merge!(offset_hash) do |key, key_value, offset_value|
      key_value + offset_value
    end
  end

  def format_input
    @input.delete(".").downcase.chars
    #other characters should be coded as itself
  end

  def input_index
    format_input.map.with_index do |letter, index|
      [letter, index, index % 4]
    end
  end
end
