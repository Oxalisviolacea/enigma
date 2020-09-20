require 'date'

class Decrypt
  attr_reader :ciphertext, :key, :date

  def initialize(ciphertext, key, date = self.todays_date)
    @ciphertext = ciphertext
    @key = key
    @date = date
  end
end
