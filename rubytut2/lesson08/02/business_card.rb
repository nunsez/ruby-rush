require 'rexml/document'

file_name = 'business_card.xml'
file_path = File.join(__dir__, file_name)

abort "Извиняемся, файлик #{file_name} не найден." unless File.exist?(file_path)

file = File.open(file_path)
doc = REXML::Document.new(file)
file.close

card = {}
keys = %w[first_name second_name last_name phone email skills]

keys.each do |key|
    card[key] = doc.root.elements[key].text
end

puts "#{card['first_name']} #{card['second_name'].chr}. #{card['last_name']}"
puts "#{card['phone']}, #{card['email']}"
puts card['skills']
