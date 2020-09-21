require 'date'

class Enigma
  attr_reader :today, :random_key
  def initialize
    @today = Date.today.strftime("%m%d%y")
    @random_key = rand(99999).to_s.rjust(5, '0')
  end

  def encrypt(message, key, date)
    encrypt = Encrypt.new(message, key, date)
    encrypt_hash = Hash.new(0)
    encrypt_hash[:encryption] = encrypt.ciphertext
    encrypt_hash[:key] = key
    encrypt_hash[:date] = date
    encrypt_hash
  end

  def decrypt(ciphertext, key, date)
    decrypt = Decrypt.new(ciphertext, key, date)
    decrypt_hash = Hash.new(0)
    decrypt_hash[:decryption] = decrypt.message
    decrypt_hash[:key] = key
    decrypt_hash[:date] = date
    decrypt_hash
  end
end
