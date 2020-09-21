require 'date'
require './lib/enigma'
require './lib/encrypt'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new
ciphertext = enigma.encrypt("The quick brown fox jumps over the lazy dog.", "2715", "40895")
puts "Created #{ARGV[1]} with the key #{enigma.key} and date #{enigma.date}"

writer = File.open(ARGV[1], "w")
writer.write(ciphertext)
