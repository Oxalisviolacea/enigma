require 'date'
require './lib/enigma'
require './lib/encrypt'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
message = incoming_text.chomp
handle.close

enigma = Enigma.new
ciphertext = enigma.encrypt(message, "2715", "40895")

writer = File.open(ARGV[1], "w")
writer.write(ciphertext)

puts "Created #{ARGV[1]} with the key #{ciphertext[:key]} and date #{ciphertext[:date]}"
