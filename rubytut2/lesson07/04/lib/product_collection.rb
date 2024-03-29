class ProductCollection
    PRODUCT_TYPES = {
        book: { dir: 'books', class: Book },
        film: { dir: 'films', class: Film }
    }.freeze

    class << self
        def from_dir(dir_path)
            products = []

            PRODUCT_TYPES.each do |_type, hash|
                product_class = hash[:class]
                product_dir = File.join(dir_path, hash[:dir])
                pattern = File.join(product_dir, '*.txt')

                Dir[pattern].each do |file_path|
                    products << product_class.from_file(file_path)
                end
            end

            new(products)
        end
    end

    def initialize(products)
        @products = products
    end

    def to_a
        @products
    end

    def sort(params)
        sort_proc = case params[:by]
                    when :price then    proc { |i| i.price }
                    when :amount then   proc { |i| i.amount }
                    when :title then    proc { |i| i.title }
                    else                proc { |i| i }
                    end

        sorted_products = @products.sort_by(&sort_proc)
        sorted_products.reverse! if params[:order] == :desc

        self.class.new(sorted_products)
    end
end
