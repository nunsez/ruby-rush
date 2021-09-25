require 'rexml/document'
require 'date'

require_relative 'lib/wish'

file_path = File.join(__dir__, 'data', 'chest.xml')

unless File.exist?(file_path)
    puts 'У вас нет желаний'
    exit
end

doc = nil

begin
    File.open(file_path, 'r:utf-8') { |file| doc = REXML::Document.new(file) }
rescue SystemCallError => e
    puts "Ошибка при чтении файла #{file_path}"
    puts e.message
    exit
rescue REXML::ParseException => e
    puts "Похоже, файл #{file_path} испорчен:"
    puts e.message
    exit
end

wishes = []

doc.elements.each('wishes/wish') do |wish_node|
    wishes << Wish.new(wish_node)
end

puts 'Эти желания должны уже были сбыться к сегодняшнему дню:'

wishes.each { |wish| puts wish if wish.overdue? }

puts
puts 'А этим желаниям ещё предстоит сбыться:'

wishes.each { |wish| puts wish unless wish.overdue? }
