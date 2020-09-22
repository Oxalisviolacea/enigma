require './lib/require_helper'

class Encrypt
  include Offsetable
  include SpecialCharacters
  include Shiftable

  attr_reader :message,
              :key,
              :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def format_input
    @message.downcase.chars
  end

  def a_shift
    Hash[alphabet.zip(alphabet.rotate(keys_and_offsets["A"]))]
  end

  def b_shift
    Hash[alphabet.zip(alphabet.rotate(keys_and_offsets["B"]))]
  end

  def c_shift
    Hash[alphabet.zip(alphabet.rotate(keys_and_offsets["C"]))]
  end

  def d_shift
    Hash[alphabet.zip(alphabet.rotate(keys_and_offsets["D"]))]
  end

  def ciphertext
    insert_special_chars.join
  end
end
