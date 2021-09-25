# rubocop:disable Metrics/ClassLength

class Product
    class << self
        def types
            [Book, Movie, Disk]
        end

        def show_types
            puts 'Какой товар вы хотите добавить?'
            puts

            types.each_with_index do |item, index|
                puts "#{index}: #{item.name}"
            end

            puts 'x. Покинуть сервис'
            puts
        end

        def read_from_xml(file_name)
            relative_path = File.join('..', 'data', file_name)
            file_path = File.expand_path(relative_path, __dir__)

            file = File.open(file_path)
            doc = REXML::Document.new(file)
            file.close

            fill_from_xml(doc)
        rescue SystemCallError => e
            abort e.message
        end

        def showcase(products)
            puts 'Что хотите купить?'
            puts

            products.each_with_index do |item, index|
                puts "#{index}: #{item.show}"
            end

            puts 'x. Покинуть магазин'
            puts
        end

        def generate_xml(file_path)
            return if File.size?(file_path)

            File.open(file_path, 'w:utf-8') do |file|
                file.puts "<?xml version='1.0' encoding='UTF-8'?>"
                file.puts '<products></products>'
            end
        end

        private

        def fill_from_xml(doc)
            products = []

            doc.each_element('products/product') do |product_node|
                price = product_node.attributes['price'].to_i
                amount_available = product_node.attributes['amount_available'].to_i

                product_node.each_element do |node|
                    products << create_product(price, amount_available, node)
                end
            end

            products
        end

        # rubocop:disable Metrics/AbcSize

        def create_product(price, amount_available, node)
            case node.name
            when 'book'
                Book.new(
                    price: price,
                    amount_available: amount_available,
                    title: node.attributes['title'],
                    author_name: node.attributes['author_name']
                )
            when 'movie'
                Movie.new(
                    price: price,
                    amount_available: amount_available,
                    title: node.attributes['title'],
                    director_name: node.attributes['director_name'],
                    year: node.attributes['year'].to_i
                )
            when 'disk'
                Disk.new(
                    price: price,
                    amount_available: amount_available,
                    album_name: node.attributes['album_name'],
                    artist_name: node.attributes['artist_name'],
                    genre: node.attributes['genre']
                )
            end
        end

        # rubocop:enable Metrics/AbcSize
    end

    def initialize(params)
        @price = params[:price]
        @amount_available = params[:amount_available]
    end

    def update(params)
        @price = params[:price] if params.key?(:price)
        @amount_available = params[:amount_available] if params.key?(:amount_available)
    end

    def read_from_console = (raise NotImplementedError)

    def info = (raise NotImplementedError)

    def show
        "#{info} — #{@price} руб. [осталось: #{@amount_available}]"
    end

    def buy
        if @amount_available.zero?
            puts 'К сожалению, больше нет'
            return 0
        end

        @amount_available -= 1

        puts '* * *'
        puts "Вы купили товар #{info}"
        puts "* * *\n\n"

        @price
    end

    def to_xml
        product = REXML::Element.new('product')

        product.add_attributes(
            'price' => @price,
            'amount_available' => @amount_available
        )
        product
    end

    def save_to_xml(file_name)
        relative_path = File.join('..', 'data', file_name)
        file_path = File.expand_path(relative_path, __dir__)

        self.class.generate_xml(file_path)

        doc = nil

        File.open(file_path, 'r:utf-8') { |file| doc = REXML::Document.new(file) }

        File.open(file_path, 'w:utf-8') do |file|
            doc.root.add_element(to_xml)
            doc.write(file, 4)
        end
    end
end

# rubocop:enable Metrics/ClassLength
