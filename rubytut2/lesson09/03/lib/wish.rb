class Wish
    def initialize(node)
        @text = node.text.strip
        @date = Date.parse(node['date'])
    end

    def overdue?
        @date < Date.today
    end

    def to_s
        "#{@date}: #{@text}"
    end
end
