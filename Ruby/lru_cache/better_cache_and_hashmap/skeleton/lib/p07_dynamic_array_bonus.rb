class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
# for negative we want i mod count, for positive, just i
    if i < 0
    return nil if i < -self.count
      return @store[i % @count]
    else
      @store[i]
    end
  end

  def []=(i, val)
    # problem is count is not incrementing when you change a value from a nil to a number

    if i < 0
      return nil if i < -self.count
       @store[i % @count] = val
      elsif i > capacity
  
        until @count == i+1
        self.push(nil)
        # push increments the count since assining a value larger than capacity fills with nills
        end
        @store[i]=val

    else
      # if @count < capacity && @store[i].nil?
      
      # end
      @store[i] = val
      @count +=1
    end

 
  end

  def capacity
    @store.length
  end

  def include?(val) # self.any iterates through each value
    self.any? {|ele| ele==val}
  end

  def push(val)
    resize! if @count  == capacity
    self[@count] = val
    @count +=1
    # resize! if 
  end

  def unshift(val)#[1,2]
    # resize! if @count ==capacity
    new_arr = StaticArray.new(capacity)
    new_arr[0]=val

    @count.times do |i|
    new_arr[i+1]=self[i]
    # p ele
    end
    # self.each 
    # new_arr =[]
    # new_arr[0]=val
    # while i < 
    @count +=1


    @store=new_arr
    resize! if @count ==capacity

  end
    # # new_arr=[]
    
    # i = @count
    # p @store
    # p val
    # p @count
    # while i >=1
    #   # p @store[i]
    # @store[i]=@store[i-1]
    # p @store
    # p @store[1]
    # p @store[0]
    # i-=1
    # end
    # # @store[0]=val
    # @store
    # # p @store
    # new_arr = []

    # @store
    
    # @store = new_arr






  # end

  def pop
    return nil if @count ==0
    p "hello there"
    p @count
    value =self[@count-1]
    self[@count-1]=nil
    @count -=1
    return value
    
  end

  def shift
    # return nil if self.count ==0
    # p "testing shift"
    # p self
    new_arr=StaticArray.new(capacity)

    value=first
    # p self
    # p new_arr
    # p @store
    # p count
    p "initial array"
    p self
    self.count.times do |i|
      p "i should be here"
      p i
      new_arr[i]=self[i+1]
      end
      @count -=1
      # p "did it delete the nil"

      # p new_arr
      @store = new_arr
      p "see if nil is gone?"
      p @store

      return value
      
    end 

    

  def first
    self[0]
  end

  def last
    self[@count-1]
  end

  def each
    i=0
    while i < @count
      yield self[i]
      i+=1
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    
    p length
    self.count.times do |i|
    return false if self[i] != other[i] 
    end
    true
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    
      new_arr = StaticArray.new(capacity*2)
      i = 0
      
      while i < @count
        new_arr[i]=self[i]
        i+=1
      end
    @store=new_arr  

    return @store

    end

  end

  if __FILE__==$PROGRAM_NAME
  a=DynamicArray.new(3)
  a[2]=0
  p a
  a.shift
  p a

  # a.shift
  # p a
  # a[5]=0
  # p a

  # a.push(1)
  # a.push(2)
  # a.push(3)
  # a.push(4)
  # a.push(5)
  # p a[-10]
end