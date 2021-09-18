require 'rexml/document'
require 'date'

file_name = 'expenses.xml'
file_path = File.join(__dir__, file_name)

abort "Извиняемся, файлик #{file_name} не найден." unless File.exist?(file_path)

file = File.open(file_path)
doc = REXML::Document.new(file)
file.close

amount_by_day = Hash.new(0)
sum_by_month = Hash.new(0)

doc.elements.each('expenses/expense') do |item|
    loss_sum = item.attributes['amount'].to_i
    loss_date = Date.parse(item.attributes['date'])
    amount_by_day[loss_date] += loss_sum
end

fmt_month = proc { |date| date.strftime('%B %Y') }
fmt_day = proc { |date| date.strftime('%d') }

amount_by_day.keys.sort.each do |key|
    sum_by_month[fmt_month.call(key)] += amount_by_day[key]
end

current_month = fmt_month.call(amount_by_day.keys.min)

render_header = proc do |month, sum|
    ph = '-' * 7
    puts "#{ph}[ #{month}, всего потрачено: #{sum[month]} р. ]#{ph}"
end

render_header.call(current_month, sum_by_month)

amount_by_day.keys.sort.each do |key|
    month = fmt_month.call(key)

    unless current_month == month
        current_month = month
        render_header.call(current_month, sum_by_month)
    end

    puts "\t#{fmt_day.call(key)}: #{amount_by_day[key]} р."
end
