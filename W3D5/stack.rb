class Stack
    def initialize
        @pile = []
    end

    def push(el)
        @pile << el
        self
    end

    def pop
        @pile.pop
    end

    def peek
        return @pile[-1]
    end

    def inspect
        "<Stack: #{stack.object_id}>"
    end
end