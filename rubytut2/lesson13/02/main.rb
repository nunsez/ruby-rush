require 'net/http'
require 'uri'
require 'json'
require 'yaml'

require_relative 'lib/forecast'

api = ENV['YANDEX_API_KEY']
abort 'Извините, YANDEX_API_KEY не найден.' if api.nil?

Forecast.use_locale('ru')

opts = {
    lat: '56.010563',
    lon: '92.852572',
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
