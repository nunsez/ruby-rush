current_path = File.dirname(__FILE__)
face_map = {
    forehead: %w[data foreheads.txt],
    eyes: %w[data eyes.txt],
    noses: %w[data noses.txt],
    mouths: %w[data mouths.txt]
}
lines = {}

face_map.each do |name, path|
    file_path = File.join(current_path, *path)

    if File.exist?(file_path)
        file = File.open(file_path, 'r:utf-8')
        lines[name] = file.readlines
        file.close
    else
        abort "Файл '#{file_path}' не найден!"
    end
end

parts = %i[forehead eyes noses mouths]

time = Time.now
file_name = "face #{time.strftime('%Y.%m.%d %H-%M-%S')}.txt"
faces_dir_path = File.join(current_path, 'faces')

Dir.mkdir(faces_dir_path) unless File.exist?(faces_dir_path)

file_path = File.join(faces_dir_path, file_name)
f = File.open(file_path, 'w:utf-8')

parts.each do |part|
    f.puts lines[part].sample
end

f.close

puts 'Done!'
