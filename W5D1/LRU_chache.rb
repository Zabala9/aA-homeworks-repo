class LRUCache
    attr_accessor :cache, :size

    def initialize(size)
        @size = size
        @cache = []
    end

    def count
        # returns number of elements currently in cache
        @cache.length
    end

    def add(el)
        # adds element to cache according to LRU principle
        if !@cache.include?(el) && @cache.length < @size
            @cache << el
        elsif @cache.include?(el) && @cache.length < @size
            @cache.delete(el)
            @cache << el
        elsif !@cache.include?(el) && @cache.length >= @size
            @cache.shift
            @cache << el
        end

    end

    def show
        # shows the items in the cache, with the LRU item first
        p @cache
    end

    private
    # helper methods go here!
    # def delete_ele(ele)
    #     @cache.delete(ele)
    # end

  end

cache_1 = LRUCache.new(4)
cache_1.add(3)
cache_1.add(1)
cache_1.add(3)
cache_1.add(9)
cache_1.add(6)
cache_1.add(4)

cache_1.show