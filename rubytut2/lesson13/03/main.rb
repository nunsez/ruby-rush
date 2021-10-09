require 'net/http'
require 'uri'
require 'json'
require 'yaml'

require_relative 'lib/forecast'

def cls
    system 'clear' or system 'cls'
end

api = ENV['YANDEX_API_KEY']
abort 'Извините, YANDEX_API_KEY не найден.' if api.nil?

Forecast.use_locale('ru')

relative_path = File.join('config', 'cities.yml')
cities = YAML.load_file(File.expand_path(relative_path, __dir__))
choice = -1

until choice.between?(1, cities.size)
    cls
    puts 'Погоду для какого города Вы хотите узнать?'
    cities.each.with_index(1) { puts "#{_2}: #{_1['name']}" }
    choice = $stdin.gets.to_i
end

city = cities[choice - 1]

opts = {
    lat: city['lat'],
    lon: city['lon'],
    lang: 'ru_RU',
    limit: '2',
    hours: 'false',
    extra: 'false'
}

uri = URI('https://api.weather.yandex.ru/v2/forecast')
uri.query = URI.encode_www_form(opts)

begin
    res = Net::HTTP.get_response(uri, 'X-Yandex-API-Key' => api)
rescue SocketError => e
    puts 'Извините, ошибка соединения с сервером погоды.'
    abort e.message
end

abort "Извините, ошибка соединения с сервером погоды: #{res.code}." unless res.code == '200'

data = JSON.parse(res.body)
forecasts = []

data['forecasts'].each do |day|
    forecasts << Forecast.parts_from_json(day)
end

city_name = data['geo_object']['locality']['name']

puts city_name
puts

%w[day evening].each do |part|
    puts
    puts forecasts.first[part]
end

%w[night morning].each do |part|
    puts
    puts forecasts[1][part]
end
