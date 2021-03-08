class LRUCache
  attr_reader :cache_size
    def initialize(cache_size)
      @cache_size=cache_size
      @cache =[]
    end

    def count
      @cache.size
      # returns number of elements currently in cache
    end

    def add(el)
      # adds element to cache according to LRU principle
      
      unless @cache.include?(el)
        @cache << el
        @cache.delete_at(0) if self.count > @cache_size
      
    else
        @cache.delete(el)
        @cache << el
    end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache.dup
    end

    private
    # helper methods go here!

  end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  p johnny_cache.show 
  johnny_cache.add(5)
  p johnny_cache.show 
  p johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  p johnny_cache.show 
  johnny_cache.add(5)
  p johnny_cache.show 
  johnny_cache.add(-5)
  p johnny_cache.show 
  johnny_cache.add({a: 1, b: 2, c: 3})
  p johnny_cache.show 
  johnny_cache.add([1,2,3,4])
  p johnny_cache.show 
  johnny_cache.add("I walk the line")
  p johnny_cache.show 
  johnny_cache.add(:ring_of_fire)
  p johnny_cache.show 
  johnny_cache.add("I walk the line")
  p johnny_cache.show 
  johnny_cache.add({a: 1, b: 2, c: 3})


  p johnny_cache.show 