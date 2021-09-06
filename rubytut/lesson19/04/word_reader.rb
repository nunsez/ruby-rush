class WordReader
    def read_from_file(file_path)
        begin
            file = File.new(file_path)
            words = file.readlines.map(&:chomp)
        rescue SystemCallError
            puts "Файл со словами '#{file_path}' не найден!"
            exit
        end

        words.sample
    end
end
