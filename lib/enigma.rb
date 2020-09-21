class Enigma
  attr_reader :today, :random_key
  def initialize
    @today = Date.today.strftime("%m%d%y")
    @random_key = rand(99999).to_s.rjust(5, '0')
  end

  def encrypt(message, key = @random_key, date = @today)
    encrypt = Encrypt.new(message, key, date)
    {encryption: "#{encrypt.ciphertext.dup}",
    key: "#{encrypt.key}",
    date: "#{encrypt.date}"}
  end

  def decrypt(ciphertext, key, date = @today)
    decrypt = Decrypt.new(ciphertext, key, date)
    {decryption: "#{decrypt.message}",
    key: "#{decrypt.key}",
    date: "#{decrypt.date}"}
  end
end
