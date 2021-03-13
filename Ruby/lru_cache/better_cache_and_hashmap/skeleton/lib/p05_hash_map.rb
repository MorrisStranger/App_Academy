require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end
  

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if self.include?(key)
      # p "hello"
      # p key
      # p val
      # p bucket(key)
      bucket(key).update(key,val)
      # p "updated"
      # p bucket(key)
    else
      # p "hello"
      # p key
      # p val
      # p bucket(key)

      if num_buckets==count
        newstore=resize!  
        each do |k,v|
        newstore[k.hash % (num_buckets*2)].append(k,v)
        end

        # subarr.each {|el| newstore[el % (num_buckets*2)]<<el }
        @store=newstore
        # p @store
      end
        bucket(key).append(key,val)
        @count+=1  
        
      



      # p "updated"
      # p bucket(key)
      end

    
   
    
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    bucket(key).remove(key)
    @count-=1
  end
  def count
    @count
  end
  def each
    (0...num_buckets).each do |i|
     @store[i].each do |node|
      yield [node.key,node.val]
     end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!

  Array.new(num_buckets*2){LinkedList.new}

  end

  def bucket(key)
    @store[key.hash % num_buckets] 
    # optional but useful; return the bucket corresponding to `key`
  end
end
if __FILE__ == $PROGRAM_NAME
  a=HashMap.new()
  a[1]=2
  a["yes"]="hello"
  a[:no]="word"

  print a.to_s
  puts
end