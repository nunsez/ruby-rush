require 'rexml/document'
require 'date'

puts 'На что потратили деньги?'
expense_text = $stdin.gets.chomp

puts 'Сколько потратили?'
expense_amount = $stdin.gets.chomp.to_i

puts 'Укажите дату траты в формате ДД.ММ.ГГГГ, например 12.05.2003 (пустое поле - сегодня)'
date_input = $stdin.gets.chomp

expense_date = Date.today if date_input.empty?

begin
    expense_date = Date.parse(date_input)
rescue ArgumentError
    expense_date = Date.today
end

puts 'В какую категорию занести трату?'
expense_category = $stdin.gets.chomp

file_name = File.join(__dir__, 'expenses.xml')
file = File.open(file_name, 'r:utf-8')
doc = nil

begin
    doc = REXML::Document.new(file)
rescue REXML::ParseException => e
    puts "Похоже, файл #{file_name} испорчен:"
    abort e.message
end

file.close

expenses = doc.elements.find('expenses').first
expense = expenses.add_element 'expense', {
    'amount' => expense_amount,
    'category' => expense_category,
    'date' => expense_date.strftime('%Y.%m.%d') # or Date#to_s
}
expense.text = expense_text

file = File.open(file_name, 'w:utf-8')
doc.write(file, 4)
file.close

puts 'Информация успешно сохранена'
