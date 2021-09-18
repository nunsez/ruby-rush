class Product
    attr_accessor :price, :amount

    class << self
        def from_file(_)
            raise NotImplementedError, 'Метод класса Product.from_file не реализован'
        end
    end

    def initialize(params)
        @price = params[:price]
        @amount = params[:amount]
    end

    def update(params)
        @price = params[:price] if params.key?(:price)
        @amount = params[:amount] if params.key?(:amount)
    end

    def to_s
        "#{price} руб. (осталось #{amount})"
    end
end
