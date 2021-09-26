require 'json'
require 'date'

file_path = File.join(__dir__, 'signs.json')
file = File.read(file_path, encoding: 'utf-8')
signs = JSON.parse(file)

puts 'Когда вы родились (укажите дату в формате ДД.ММ, например, 08.03)'
user_date_str = $stdin.gets.chomp

YEAR = '2000'.freeze
user_date = Date.parse("#{user_date_str}.#{YEAR}")
user_sign = nil

signs.each do |_key, sign|
    dates = sign['dates']
            .split('..')
            .map { |day_mon| Date.parse("#{day_mon}.#{YEAR}") }

    user_sign = sign if user_date.between?(dates.first, dates.last)
end

puts user_sign['dates']
puts user_sign['text']
