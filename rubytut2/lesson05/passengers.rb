passengers = [
    {
        ticket_number: 'РМ2010398 050298',
        first_name: 'Венедикт',
        second_name: 'Васильевич',
        last_name: 'Ерофеев',
        passport_number: '45 99 505281',
        departure_city: 'Москва',
        destination_city: 'Петушки'
    },
    {
        ticket_number: 'РМ2010399 050298',
        first_name: 'Иннокентий',
        second_name: 'Петрович',
        last_name: 'Шниперсон',
        passport_number: '46 01 192872',
        departure_city: 'Павловский Посад',
        destination_city: 'Орехово-Зуево'
    },
    {
        ticket_number: 'РМ2010400 050298',
        first_name: 'Иван',
        second_name: 'Васильевич',
        last_name: 'Бунша',
        passport_number: '47 33 912876',
        departure_city: 'Москва',
        destination_city: 'Владимир'
    }
]

puts 'Пассажиры поезда Москва — Петушки'

passengers.each_with_index do |passenger, i|
    ticket, from, to, f_name, s_name, l_name, psprt = passenger.values_at(
        :ticket_number, :departure_city, :destination_city,
        :first_name, :second_name, :last_name, :passport_number
    )
    puts
    puts "* * * Место № #{i + 1} * * *"
    puts "Билет № #{ticket}"
    puts "Маршрут: #{from} - #{to}"
    puts "Пассажир: #{f_name} #{s_name[0]}. #{l_name}"
    puts "Паспорт: #{psprt}"
end
