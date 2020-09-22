require './lib/enigma'
require './lib/encrypt'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
message = incoming_text.chomp
handle.close

enigma = Enigma.new
if ARGV[2] == nil
  ARGV[2] = enigma.random_key
end
if ARGV[3] == nil
  ARGV[3] = enigma.today
end

ciphertext = enigma.encrypt(message, ARGV[2], ARGV[3])
writer = File.open(ARGV[1], "w")
writer.write(ciphertext)

puts "Created #{ARGV[1]} with the key #{ciphertext[:key]} and date #{ciphertext[:date]}"
