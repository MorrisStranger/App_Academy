class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
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

  def include?(key)

    self[key].include?(key)
  end

  def remove(key)
    return false unless self.include?(key)
    self[key].delete(key)
    @count-=1
    # key
    
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    Array.new(num_buckets*2){Array.new}
    
end
end
