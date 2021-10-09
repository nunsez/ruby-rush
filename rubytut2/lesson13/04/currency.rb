require 'json'
require 'net/http'
require 'uri'

uri = URI('https://www.cbr-xml-daily.ru/daily_json.js')

begin
    res = Net::HTTP.get_response(uri)
rescue SocketError
    abort 'Извините, ошибка соединения с сервером Центробанка.'
end

abort "Извините, ошибка соединения с сервером Центробанка: #{res.code}." unless res.code == '200'

data = JSON.parse(res.body)

data['Valute'].each do |code, valute|
    puts "#{valute['Name']}: #{valute['Value']} руб."
end
