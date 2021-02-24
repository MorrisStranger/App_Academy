list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
def my_min(list)#O(n^2)
    min = list.first
    (0...list.length).each do |i|
        (0...list.length).each do |j|
            next if i==j
            min=list[j] if min>list[j] 
        end
    end
    min
end
p my_min(list)

# def better_my_min#O(n)
# end
def largest_contiguous_subsum(list)
   i=0
   j=0
   q=0
   subarrays=[]
   while i < list.length
    while j < list.length
        subarrays << list[i..j]
        j+=1
        # p q
        q+=1
    end#
    i+=1
    j=i
    end
    # p subarrays.length
    subarrays.map do |ele|
        ele.inject(:+) 
    end.inject do |acc,ele| acc>ele ?  acc :ele
    
    end
end
# list = [-5, -1, -3]
list = (0...1000).to_a
# BigO is O(n^2)

def better_largest_contiguous_subsum(list)
    sum =0
    newsum=0
    list.each do |ele|
        if ele>0 
            sum+=ele 
            newsum+=ele
        else newsum=0
        end
        sum=newsum if newsum>sum 
        
    end
    sum
    # '''# O(n) time acheived by looping through once
    # what you do is you start with the first element 
    # and loop through each element
    # if the element is greater than 0 then we add it
    #     to the sum

    # if it is less than 0 then we set a newsum to 0
    #     if newsum > sum set sum to newsum
    #         return sum
    
     
    # we add 
    #     '''

end
p better_largest_contiguous_subsum(list)
p largest_contiguous_subsum(list)
