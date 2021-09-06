require 'pony'
require 'io/console'

puts 'Введите имя почтового ящика gmail.com'
my_mail = "#{$stdin.gets.chomp}@gmail.com"

puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
password = $stdin.noecho(&:gets).chomp

puts 'Кому отправить письмо? Введите адрес:'
send_to = $stdin.gets.chomp

puts 'Что написать в теме письма?'
subject = $stdin.gets.chomp.encode('utf-8')

puts 'Что написать в теле письма?'
body = $stdin.gets.chomp.encode('utf-8')

begin
    Pony.mail({
        subject: subject,
        body: body,
        to: send_to,
        from: my_mail,
        via: :smtp,
        via_options: {
            address: 'smtp.gmail.com',
            port: '587',
            enable_starttls_auto: true,
            user_name: my_mail,
            password: password,
            authentication: :plain
        }
    })

    puts 'Письмо отправлено!'
rescue SocketError
    puts 'Не могу соединиться с сервером.'
rescue Net::SMTPSyntaxError => e
    puts "Вы некорректно задали параметры письма: #{e.message}"
rescue Net::SMTPAuthenticationError => e
    puts "Неправильный пароль, попробуйте еще: #{e.message}"
ensure
    puts 'Мы постарались отправить письмо.'
end
