require 'net/http'
require 'uri'
require 'json'
require 'yaml'

api = ENV['YANDEX_API_KEY']
abort 'Извините, YANDEX_API_KEY не найден.' if api.nil?

ru = YAML.load_file(File.expand_path('ru.yml', __dir__))

opts = {
    lat: '56.010563',
    lon: '92.852572',
    lang: 'ru_RU',
    limit: '1',
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
    exit
end

abort "Извините, ошибка соединения с сервером погоды: #{res.code}." unless res.code == '200'

data = JSON.parse(res.body)

city_name = data['geo_object']['locality']['name']
condition = data['fact']['condition']
condition_ru = ru['weather']['condition'][condition]
wind_dir = data['fact']['wind_dir']
wind_dir_ru = ru['weather']['wind_dir'][wind_dir]

puts "Сейчас #{Time.now.strftime('%H:%M')}, погода в городе #{city_name}:"
puts
puts "Температура: #{data['fact']['temp']}°C"
puts "Ощущается как: #{data['fact']['feels_like']}°C"
puts "Погода: #{condition_ru}"
puts "Ветер: #{data['fact']['wind_speed']} м/с, #{wind_dir_ru}"
puts "Давление: #{data['fact']['pressure_mm']} мм рт. ст."
puts "Влажность воздуха: #{data['fact']['humidity']}%"
