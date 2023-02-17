class Queue
    def initialize
        @tail = []
    end

    def enqueue(el)
        @tail << el
    end

    def dequeue
        @tail.shift
    end

    def peek
        @tail[-1]
    end
end
