module Offsetable
  def offset_squared
    @date.to_i ** 2
  end
  
  def letter_array
    letter_array = ("A".."D").to_a
  end

  def key_hash
    key_str = @key.rjust(5, '0')
    number_str_array = [key_str[0..1], key_str[1..2],
    key_str[2..3], key_str[3..4]]
    number_array = number_str_array.map {|number| number.to_i}
    Hash[letter_array.zip(number_array)]
  end

  def offset_hash
    number_str_array = offset_squared.to_s[-4..-1].split("")
    number_array = number_str_array.map {|number| number.to_i}
    Hash[letter_array.zip(number_array)]
  end

  def keys_and_offsets
    key_hash.merge!(offset_hash) do |key, key_value, offset_value|
      key_value + offset_value
    end
  end
end
