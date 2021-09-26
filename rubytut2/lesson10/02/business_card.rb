require 'json'

file_path = File.join(__dir__, 'business_card.json')
file = File.read(file_path, encoding: 'utf-8')
card = JSON.parse(file)

puts "#{card['first_name']} #{card['second_name'].chr}. #{card['last_name']}"
puts "#{card['phone']}, #{card['email']}"
puts card['skills']
