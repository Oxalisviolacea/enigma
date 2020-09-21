require './lib/encrypt'

class Enigma
  attr_reader :message, :ciphertext
  def initialize
  end

  def encrypt(message, key, date)
    encrypt = Encrypt.new(message, key, date)
    {encryption: "#{encrypt.ciphertext}",
    key: "#{encrypt.key}",
    date: "#{encrypt.date}"}
  end

  def decrypt(ciphertext, key, date)
    decrypt = Decrypt.new(ciphertext, key, date)
    {decryption: "#{decrypt.message}",
    key: "#{decrypt.key}",
    date: "#{decrypt.date}"}
  end
end
