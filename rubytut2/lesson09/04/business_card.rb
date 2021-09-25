require 'rexml/document'

get_file_path = proc { |ext| File.join(__dir__, "business_card.#{ext}") }

xml_path = get_file_path.call('xml')
html_path = get_file_path.call('html')

abort 'Визитная карточка не найдена' unless File.exist?(xml_path)

doc = nil

File.open(xml_path, 'r:utf-8') do |file|
    doc = REXML::Document.new(file)
rescue REXML::ParseException => e
    abort e.message
end

card = {}

%w[first_name second_name last_name phone email skills photo].each do |field|
    card[field] = doc.root.elements[field].text
end

html = REXML::Document.new
html.add_element('html', 'lang' => 'ru')
head = html.root.add_element('head')
body = html.root.add_element('body')

head.add_element('meta', 'charset' => 'utf-8')
head.add_element('title').add_text(
    "Визитная карточка #{card['first_name'].chr}.#{card['second_name'].chr} #{card['last_name']}"
)

body.add_element('img', 'src' => card['photo'])
body.add_element('h1').add_text("#{card['first_name']} #{card['second_name']} #{card['last_name']}")
body.add_element('p').add_text(card['skills'])
body.add_element('p').add_text("Телефон: #{card['phone']}")
body.add_element('p').add_text("Email: #{card['email']}")

begin
    File.open(html_path, 'w:utf-8') do |file|
        file.puts '<!DOCTYPE HTML>'
        html.write(file, 4)
    end
rescue SystemCallError => e
    abort e.message
end
