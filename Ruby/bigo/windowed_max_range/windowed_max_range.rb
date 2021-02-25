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
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

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
