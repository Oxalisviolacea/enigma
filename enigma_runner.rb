require 'date'
require './lib/enigma'
file = File.open(ARGV[0], "r")
message = file.read
file.close

enigma = Enigma.new
enigma.encrypt(message, "02715", "040895")

# #this will return the hash with the ecrypted message
# enigma.decrypt("keder ohulw", "02715", "040895")
# #this will return the hash with the decypted message
# encrypted = enigma.encrypt("hello world", "02715")
# #returns hash with default as todays date
# enigma.decrypt(encrypted[:encryption], "02715")
# #returns hash with default as todays date
# enigma.encrypt("hello world")
# #returns hash with random key and default as todays date
