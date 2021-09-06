class WordReader
    def read_from_file(file_path)
        abort "Файл '#{file_path}' не найден!" unless File.exist?(file_path)

        file = File.new(file_path)
        words = file.readlines.map(&:chomp)

        words.sample
    end
end
