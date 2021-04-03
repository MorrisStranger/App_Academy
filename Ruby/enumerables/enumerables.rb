require "byebug"
class Array
    def my_inject(&prc)
        acc=self[0]
        (1...self.length).to_a.my_each do |a|
        acc=prc.call(acc,a)

        end
acc
        

    end
    def my_each(&prc)
        i=0
        while i<self.length 
        prc.call(self[i])
        i+=1
        
        end
        self
    end
    def my_select(&prc)
        values=[]
        self.my_each {|num| values << num if prc.call(num)}
    values
    end
    def my_reject(&prc)
        values=[]
        self.my_each {|num| values << num if !prc.call(num)}
    values
    end
    def my_any?(&prc)
        self.my_each {|ele| return true if prc.call(ele)}
    false
    end
    def my_all?(&prc)
    self.my_each {|ele| return false if !prc.call(ele)}
    true
    end
    def my_flatten
    flattened=[]
        if self.all?{|ele| !ele.is_a? Array}
            return self    
        else
            self.each do |ele2| 
                if !ele2.is_a? Array
                    flattened += [ele2]
                else 
                    flattened += ele2.my_flatten
                end
            end
        end
        return flattened  
                

    
    end

    def my_zip(*args)

        zipped_arr=Array.new(self.length) {Array.new(args.length+1)}
        (0...zipped_arr.length).each do |idx| # each element of zipped arr
            zipped_arr[idx][0]=self[idx]
            (1..args.length).each do |arg|
                zipped_arr[idx][arg]= args[arg-1][idx]
        end    
        

        end
        zipped_arr        
  
    end
def my_rotate(dir=-1)
    rotated=Array.new(self.length)
    (0...self.length).each do |i|
    rotated[i] = self[(i+dir) % self.length]
    end
    rotated
end
def my_join(sep="") 
return self.join(sep)
end
def my_reverse
i=-1
reversed=[]
while i>=-1*self.length
reversed << self[i]
i-=1
end
reversed
end
end
p [1,2,3,4].my_inject {|a,b| a-b}
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

a = [1,2,3]
p a.my_select {|num| num>1}
p a.my_select { |num| num == 4 }

p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]


p a.my_any? { |num| num > 1 }
p a.my_any? { |num| num == 4 }
p a.my_all? { |num| num > 1 }
p a.my_all? { |num| num < 4 } # => true
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b)
p a.my_zip([1,2], [8])
p [1, 2].my_zip(a, b) 
c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)
a = [ "a", "b", "c", "d" ]
p a.my_rotate
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")
p [ "a", "b", "c" ].my_reverse
p [ 1 ].my_reverse 


def bubble_sort!(&prc)
    arr=[5,6,9,9,8]
    sorted = false
    while !sorted
        sorted=true

    (0...arr.length-1).each do |i|
    if prc.call(arr[i],arr[i+1])
        sorted=false
        arr[i],arr[i+1]=arr[i+1],arr[i]
    end
    end
    
end
arr
end

def bubble_sort(&prc)
    arr=[5,6,9,9,8]

    copy_arr=[*arr]
    sorted = false

    while !sorted
        sorted=true
        # debugger

    (0...copy_arr.length-1).each do |i|
    if prc.call(copy_arr[i],copy_arr[i+1])
        sorted=false
        copy_arr[i+1],copy_arr[i]=copy_arr[i],copy_arr[i+1]
        # arr[i],arr[i+1]=arr[i+1],arr[i]
    end
    end
    
end
copy_arr
end


p bubble_sort! {|a,b|a<b}
p bubble_sort {|a,b|a<b}
# [1,2,3,4,5].bubblesort!

# bubble_sort {|a,b| a>b}