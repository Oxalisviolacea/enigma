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
end
