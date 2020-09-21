require 'date'
require './lib/enigma'
require './lib/encrypt'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new
ciphertext = enigma.encrypt(message, "02715", "040895")
puts "Created #{ARGV[1]} with the key #{enigma.key} and date #{enigma.date}"

writer = File.open(ARGV[1], "w")
writer.write(ciphertext)



# #this will return the hash with the ecrypted message
# enigma.decrypt("keder ohulw", "02715", "040895")
# #this will return the hash with the decypted message
# encrypted = enigma.encrypt("hello world", "02715")
# #returns hash with default as todays date
# enigma.decrypt(encrypted[:encryption], "02715")
# #returns hash with default as todays date
# enigma.encrypt("hello world")
# #returns hash with random key and default as todays date
