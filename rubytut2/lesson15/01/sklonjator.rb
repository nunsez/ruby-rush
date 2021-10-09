class Sklonjator
    # rubocop:disable Style/OptionalBooleanParameter

    def self.sklonenie(number, krokodil, krokodila, krokodilov, with_number = false)
        number = 0 unless number.is_a?(Numeric)
        result = krokodilov
        prefix = with_number ? "#{number} " : ''

        rest = number % 10
        result = krokodila if rest >= 2 && rest <= 4
        result = krokodil  if rest == 1

        rest100 = number % 100
        result = krokodilov if rest100 >= 11 && rest100 <= 14

        "#{prefix}#{result}"
    end

    # rubocop:enable Style/OptionalBooleanParameter
end
