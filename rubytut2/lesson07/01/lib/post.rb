class Post
    class << self
        def post_types
            [Memo, Task, Link]
        end

        def create(type_index)
            post_types[type_index].new
        end
    end

    def initialize
        @created_at = Time.now
        @text = []
    end

    def file_path
        current_path = File.dirname(__FILE__)

        class_name = self.class.name
        file_mame = @created_at.strftime("#{class_name}_%Y-%m-%d_%H-%M-%S.txt")
        posts_path = File.join(current_path, '..', 'posts')

        Dir.mkdir(posts_path) unless File.exist?(posts_path)

        File.join(posts_path, file_mame)
    end

    def read_from_console
    end

    def save
    end
end
