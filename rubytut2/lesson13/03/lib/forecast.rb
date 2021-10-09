require 'date'

class Forecast
    PARTS = %w[night morning day evening].freeze
    @translates = {}

    class << self
        attr_reader :translates

        def use_locale(locale)
            relative_path = File.join('..', 'locales', "#{locale}.yml")
            @translates = YAML.load_file(File.expand_path(relative_path, __dir__))
        rescue SystemCallError
            abort "Ошибка при использовании локали #{locale}. Невозможно прочитать файл."
        rescue Psych::SyntaxError
            abort "Ошибка синтаксиса при использовании локали #{locale}."
        end

        def parts_from_json(day_forecast)
            params = {}
            parts = {}
            params['date'] = Date.parse(day_forecast['date'])

            PARTS.each do |part|
                params['part'] = part
                part_forecast = day_forecast['parts'][part]
                parts[part] = new(part_forecast.merge(params))
            end

            parts
        end
    end

    def initialize(params)
        @date = params['date']
        @part = params['part']

        @temp_min = params['temp_min']
        @temp_max = params['temp_max']
        @wind_speed = params['wind_speed']
        @wind_dir = params['wind_dir']
        @condition = params['condition']
    end

    def to_s
        translates = self.class.translates
        part = translates['day_part'][@part]
        date = today? ? 'Сегодня' : @date.strftime('%d.%m.%Y')
        wind_dir = translates['weather']['wind_dir'][@wind_dir]
        condition = translates['weather']['condition'][@condition]

        "#{date}, #{part}\n" \
            "#{temp_range_string}, ветер #{wind_dir} #{@wind_speed} м/с, #{condition}"
    end

    def today?
        @date == Date.today
    end

    private

    def temp_range_string
        "#{temp_to_s(@temp_min)}..#{temp_to_s(@temp_max)}"
    end

    def temp_to_s(temp)
        temp.to_i.positive? ? "+#{temp}" : temp.to_s
    end
end
