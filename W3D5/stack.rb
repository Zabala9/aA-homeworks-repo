class Stack
    def initialize
        @pile = []
    end

    def push(el)
        @pile << el
    end

    def pop
        @pile.pop
    end

    def peek
        return @pile[-1]
    end

end