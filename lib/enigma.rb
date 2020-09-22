require 'date'

class Enigma
  def initialize
  end

  def today
    Date.today.strftime("%m%d%y")
  end

  def random_key
    rand(99999).to_s.rjust(5, '0')
  end

  def encrypt(message, key, date)
    encrypt = Encrypt.new(message, key, date)
    encrypt_hash = Hash.new
    encrypt_hash[:encryption] = encrypt.ciphertext
    encrypt_hash[:key] = key
    encrypt_hash[:date] = date
    encrypt_hash
  end

  def decrypt(ciphertext, key, date)
    decrypt = Decrypt.new(ciphertext, key, date)
    decrypt_hash = Hash.new
    decrypt_hash[:decryption] = decrypt.message
    decrypt_hash[:key] = key
    decrypt_hash[:date] = date
    decrypt_hash
  end
end
