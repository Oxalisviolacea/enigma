class Enigma
  attr_reader :message, :ciphertext
  def initialize
    @message = message
    @ciphertext = ciphertext
  end

  def encrypt(message, key, date)
    Encrypt.new(message, key, date)
    encrypt_hash = {
    encryption: "#{encrypt.ciphertext}",
    key: "#{encypt.key}",
    date: "#{encrypt.date}"
    }
  end

  def decrypt(ciphertext, key, date)
    Decrypt.new(ciphertext, key, date)
    decrypt_output = {
    encryption: "#{encrypt.message}",
    key: "#{encypt.key}",
    date: "#{encrypt.date}"
    }
  end
end
