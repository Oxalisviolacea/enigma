require 'date'
require './lib/enigma'
require './lib/encrypt'
require './lib/decrypt'

handle = File.open(ARGV[0], "r")
ciphertext_string = handle.read
handle.close
ciphertext = eval(ciphertext_string)

enigma = Enigma.new
if ARGV[3] == nil
  ARGV[3] = enigma.today
end
message = enigma.decrypt(ciphertext[:encryption], ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(message[:decryption])

puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
