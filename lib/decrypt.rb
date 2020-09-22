require './lib/require_helper'

class Decrypt
  include Offsetable
  include SpecialCharacters
  include Shiftable

  attr_reader :ciphertext,
              :key,
              :date

  def initialize(ciphertext, key, date)
    @ciphertext = ciphertext
    @key = key
    @date = date
  end

  def format_input
    @ciphertext.downcase.chars
  end

  def a_shift
    Hash[alphabet.rotate(keys_and_offsets["A"]).zip(alphabet)]
  end

  def b_shift
    Hash[alphabet.rotate(keys_and_offsets["B"]).zip(alphabet)]
  end

  def c_shift
    Hash[alphabet.rotate(keys_and_offsets["C"]).zip(alphabet)]
  end

  def d_shift
    Hash[alphabet.rotate(keys_and_offsets["D"]).zip(alphabet)]
  end

  def message
    insert_special_chars.join
  end
end
