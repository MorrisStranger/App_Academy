class Stack
    def initialize
      # create ivar to store stack here!
      @ivar=[]
    end

    def push(el)
        @ivar << el
      # adds an element to the stack
    end

    def pop
        @ivar.pop
      # removes one element from the stack
    end

    def peek
        @ivar[-1]
      # returns, but doesn't remove, the top element in the stack
    end
  end
  # stack=Stack.new
  # stack.push(1)
  # p stack
  # stack.push(2)
  # p stack.peek
  # p stack
  # stack.pop
  # p stack
  # p stack.peek

  class Queue
    def initialize
        @arr=[]


    end
    def enqueue(el)
        @arr << el
    end
    def dequeue
    @arr=@arr[1..-1]
    end    
    def peek
       @arr[0] 
    end

    end


class Map
    def initialize
        @my_map =[]
    end
    def set(key,value)
      exists=existing?(key)
     if exists=="no"
      @my_map << [key,value]
    else
      @my_map[exists][1]=value
    end
    end
    def get(key)
    @my_map.each do |ele|
    return ele[1] if ele[0]==key
    end
    return nil
    end
    def delete(key)
      @my_map.each do |ele|
        @my_map.delete(ele) if ele[0]==key
      end
    end
    def show
        @my_map
    end
    private
    def existing?(key)
        @my_map.each.with_index do |ele,i|
        if ele[0]==key
        return i  
      end
        end
        return "no"
    end
end


    # q = Queue.new
    # q.enqueue(10)
    # p q
    # q.enqueue(11)
    # p q
    # p q.peek
    # q.enqueue(12)
    # p q
    # q.dequeue
    # p q
    # q.dequeue
    # p q

  map=Map.new
  map.set("a",20)
  p map.show
  map.set("b",30)
  p map.show

  map.set("a",30) 
   p map.show
 q=map.get("x")
 p q
 p map.show
 map.delete("a")
p map.show