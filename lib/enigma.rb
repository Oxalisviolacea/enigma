class Enigma
  attr_reader :message, :ciphertext
  def initialize
    @message = message
    @ciphertext = ciphertext
  end

  # def read_message
  #   file = File.open(ARGV[0], "r")
  #   @message = file.read
  #   file.close
  # end

  def encrypt(message, key, date)
    read_message
    Encrypt.new(message, key, date)
    encrypt_output
    @ciphertext = @message.encrypt.message
    write_ciphertext
  end

  def ecrypt_output
    encrypt_hash = {
    encryption: "#{encrypt.message}",
    key: "#{encypt.key}",
    date: "#{encrypt.date}"
    }
    puts encryption_hash
  end

  def write_ciphertext
    writer = File.open(ARGV[1], "w")
    @ciphertext = writer.write(@message)
    writer.close
  end

  def read_ciphertext
    file = File.open(ARGV[0], "r")
    @ciphertext = file.read
    file.close
  end

  def decrypt(ciphertext, key, date)
    read_ciphertext
    Decrypt.new(ciphertext, key, date)
    decrypt_output
  end

  def decrypt_output
    decryption_hash = {
    decryption: "#{decrypt.message}",
    key: "#{decrypt.key}",
    date: "#{decrypt.date}"
    }
    puts decryption_hash
  end

  def write_message
    writer = File.open(ARGV[1], "w")
    @message = writer.write(@ciphertext)
    writer.close
  end
end
