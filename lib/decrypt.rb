require 'date'

class Decrypt
  attr_reader :ciphertext, :key, :date

  def initialize(ciphertext, key, date = self.todays_date)
    @ciphertext = ciphertext
    @key = key
    @date = date
  end

  def key_hash
    key_str = @key.rjust(5, '0')
    number_str_array = [key_str[0..1], key_str[1..2],
    key_str[2..3], key_str[3..4]]
    number_array = number_str_array.map {|number| number.to_i}
    letter_array = ("A".."D").to_a
    Hash[letter_array.zip(number_array)]
  end

  def todays_date
    Date.today.strftime("%m%d%y")
  end

  def offset_squared
    date.to_i ** 2
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
    @ciphertext.downcase.chars
  end

  def input_index
    format_input.map.with_index do |letter, index|
      [letter, index, index % 4]
    end
  end

  def find_special_chars
    input_index.find_all do |array|
      !alphabet.include?(array[0])
    end
  end

  def array_without_special_chars
    input_index.find_all do |array|
      alphabet.include?(array[0])
    end
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def a_shift
    shift = keys_and_offsets["A"]
    Hash[alphabet.zip(alphabet.rotate(shift))].invert
  end

  def b_shift
    shift = keys_and_offsets["B"]
    Hash[alphabet.zip(alphabet.rotate(shift))].invert
  end

  def c_shift
    shift = keys_and_offsets["C"]
    Hash[alphabet.zip(alphabet.rotate(shift))].invert
  end

  def d_shift
    shift = keys_and_offsets["D"]
    Hash[alphabet.zip(alphabet.rotate(shift))].invert
  end

  def shift
    shift_array = []
    array_without_special_chars.each do |input_array|
      if input_array[2] == 0
        shift_array << a_shift.fetch(input_array[0])
      elsif input_array[2] == 1
        shift_array << b_shift.fetch(input_array[0])
      elsif input_array[2] == 2
        shift_array << c_shift.fetch(input_array[0])
      elsif input_array[2] == 3
        shift_array << d_shift.fetch(input_array[0])
      end
    end
    shift_array
  end

  def insert_special_chars
    find_special_chars.flat_map do |array|
      shift.insert(array[1], array[0])
    end
  end
end
