require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/link'
require_relative 'lib/task'

require 'optparse'
require 'date'

options = {}

OptionParser.new do |opt|
    opt.banner = 'Usage: read.rb [options]'

    opt.on('-h', '--help', 'Prints this help') do
        puts opt
        exit
    end

    opt.on(
        '-t', '--type POST_TYPE', 'Какой тип постов показывать (по умолчанию любой)'
    ) { |o| options[:type] = o }

    opt.on(
        '-f', '--id POST_ID', 'Если задан id — показываем подробно только этот пост'
    ) { |o| options[:id] = o }

    opt.on(
        '-l', '--limit NUMBER', 'Сколько последних постов показать (по умолчанию все)'
    ) { |o| options[:limit] = o }
end.parse!

result = options[:id] ? Post.find_by_id(options[:id]) : Post.find_all(options)

if result.nil?
    puts "Такой id: #{options[:id]} не найден в базе."
    exit
end

if result.is_a? Post
    puts "Запись #{result.class.name}, id = #{options[:id]}"
    puts result.to_strings.join("\n")
    exit
end

ljst = proc { |s, n| "#{s.to_s[0...n].gsub("\n", "\s").ljust(n)} | " }

print ljst['ID', 5]
print ljst['Type', 5]
print ljst['Content', 30]
print ljst['URL', 17]
print ljst['Due Date', 14]
print ljst['Created at', 14]
print ljst['Updated at', 14]
print "\n"

result.each do |row|
    row.each do |k, v|
        s = case k
            when :content then ljst[v, 30]
            when :due_date, :updated_at, :created_at then ljst[Post.date_fmt(v), 14]
            when :url then ljst[v, 17]
            else ljst[v, 5]
            end
        print s
    end

    puts
end
