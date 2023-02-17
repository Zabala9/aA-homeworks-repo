class Queue
    def initialize
        @tail = []
    end

    def enqueue(el)
        @tail << el
        self
    end

    def dequeue
        @tail.shift
    end

    def peek
        @tail[-1]
    end

    def inspect
        "<Stack: #{stack.object_id}>"
    end
end
