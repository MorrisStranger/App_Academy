class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}

  end
  def store
    @store.dup
  end
  def insert(num)
    raise "Out of bounds" if num < 0 || num > @max
    unless @store[num]
      @store[num] = true 
      return true
    end
  end

  def remove(num)
    raise "invalid range" if num < 0 || num > @max
    @store[num]=false if @store[num]
  end

  def include?(num)
    raise "invalid range" if num < 0 || num > @max
    @store[num]

  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if self[num].include?(num)
      self[num] << num 
      num
  end

  def remove(num)
    self[num].delete(num)
  end

    def include?(num)
      self[num].include?(num)
    end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if self[num].include?(num)
    self[num] << num
    @count+=1
    if num_buckets==count
      newstore=resize!  
      @store.each do |subarr|
      subarr.each {|el| newstore[el % (num_buckets*2)]<<el }
      end
      @store=newstore
    end
    num
  end

  def remove(num)
    if include?(num)
    self[num].delete(num) 
    @count-=1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      Array.new(num_buckets*2){Array.new}
      
  end
end
