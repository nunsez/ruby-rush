face_map = {
    forehead: 'data/foreheads.txt',
    eyes: 'data/eyes.txt',
    noses: 'data/noses.txt',
    mouths: 'data/mouths.txt'
}
lines = {}

face_map.each do |name, path|
    if File.exist?(path)
        file = File.new(path, 'r:utf-8')
        lines[name] = file.readlines
        file.close
    else
        abort "Файл '#{path}' не найден!"
    end
end

parts = %i[forehead eyes noses mouths]

parts.each do |part|
    puts lines[part].sample
end
