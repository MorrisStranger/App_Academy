def windowed_max_range(arr,w)#O(n^2) since .max is O(n) in the worst case!
    # space complexity is O(n) since in worst case w is approx = n
    current_max_range=0
    (0...arr.length-w+1).each do |i|
        slice=arr[i...i+w]
        max=slice.max
        min=slice.min
        range=max-min
    
        current_max_range=range if range>current_max_range
    end
    current_max_range
end
# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

#Queue brings down slice from O(n) to O(1)
class MyQueue
    def initialize
        @store=[]
    end
    def peek
        @store[-1]
    end
    def size
        @store.size
    end
    def empty?
        @store.empty?
    end
    def enqueue(ele)
        @store << ele

    end
    def dequeue()
        @store.delete_at(0)

    end
end
# stack used to optimize min-max bringing down from O(n) to O(1)
class MyStack
    def initialize
    @store = []
    end
    def peek
        @store[-1]
    end
    def size
        @store.size
    end
    def empty?
        @store.empty?
    end
    def pop
        @store.pop
    end
    def push(ele)
        @store << ele
    end


end

class StackQueue # dequeue O(1)
    def initialize
        @stack1=MyStack.new()
        @stack2=MyStack.new()
    end
    def size
        @stack1.size + @stack2.size
    end
    def empty?
        @stack1.empty? && @stack2.empty?
    end
    def enqueue(x)
        until @stack1.empty?
            @stack2.push(@stack1.pop)
        end
        @stack1.push(x)
        until @stack2.empty?
        @stack1.push(@stack2.pop)

        end
    end
    def dequeue
        @stack1.pop
    end

end
# q=StackQueue.new()
# q.enqueue(3)
# q.enqueue(4)
# q.enqueue(5)
# p q.size
# p q.dequeue
# p q.size

class MinMaxStack # O(1) max and min methods
    def initialize
        @store = {}
        end
        def peek
            @store.keys.last
        end
        def size
            @store.size
        end
        def empty?
            @store.empty?
        end
        def pop
            @store.delete(@store.keys.last)

        end
        def push(ele)
            
            @store[ele] =[ele,ele]  if self.empty?
            min=@store.values.last[0]
            max=@store.values.last[1]
            @store[ele]= [(ele < min ? ele : min),(ele > max  ? ele : max)]
        end
        def max
            @store.values.last[1]
        end
        def min
            @store.values.last[0]
        end
end

class MinMaxStackQueue # dequeue O(1)
    def initialize
    @stack1 = MinMaxStack.new()
    @stack2 = MinMaxStack.new()
    end
    def size
        @stack1.size+@stack2.size
    end
    def empty?
        @stack1.empty? && @stack2.empty?
    end
    def enqueue(ele) # O(n)
        #want oldest to be at top of stack1
        until @stack1.empty?
            @stack2.push(@stack1.pop)
        end
        @stack2.push(ele)
        until @stack2.empty?
        @stack1.push(@stack2.pop)
        end
    end
    def dequeue #O(1)
        @stack1.pop
    end
    def max
        @stack1.max
    end
    def min
        @stack1.min
    end
   
end
queue=MinMaxStackQueue.new




#enqueue
#loop through elements
#to solve in O(n) time need to use dequeue,
#enqueue of O(n)


=begin to get O(1) dequeing:
pop from stack1

need O(n) enqueue:
if stack1 not empty move all elements from stack1 to stack2
add element to stack1
move all elements from stack2 to stack1

to get O(1) enqueue:
stack1 << x

need O(n) dequeue:
if stack2 not empty: stack2.pop
if stack1 not empty move all elements from stack1 over to stack2

    stack2.pop 
=end
