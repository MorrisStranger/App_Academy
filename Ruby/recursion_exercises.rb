def range(start,ender)
#base case
return [] if (ender<=start)
#general method
range(start,ender-1) << ender-1
end

p range(1,6)

def recursive_sum_array(arr)
return 0 if arr.empty?
    arr.pop+recursive_sum_array(arr)
end

p recursive_sum_array([1,2,3,4,5])
def iterative_sum_array(arr)
    arr.inject {|acc,ele|acc+ele}

end
p iterative_sum_array([1,2,3,4,5])


def recursive_exp_1(b,n)
return 1 if n == 0
b*recursive_exp_1(b,n-1)
end

p recursive_exp_1(10,3)

def recursive_exp_2(b,n)
return 1 if n ==0
return b if n ==1
if n %2 ==0
recursive_exp_2(b,n/2)**2
else
    subarr=recursive_exp_1(b, (n - 1) / 2)
    result=b * (subarr *subarr)
end


end
p recursive_exp_2(10,5)

# 
# class Array
# def deep_dup
# #base case
# arr =[]
# return self if self.length ==1
# self.each do |ele|
# if ele.is_a? Array
#     # ele[0...-1]+ele[-1]
#     deep_dup(ele)+[ele.pop] 
# else
# end
# end


# end
# end
# a=[1, [2], [3, [4]]]
# b=a.deep_dup
# a[0]=100
# p a
# p b



def recursive_fibonacci(n)
return [1] if n == 1 
return [1,1] if n== 2
# a = recursive_fibonacci(n-1)
# b = a[-1]
# c=a[-2]
# a+=(b+c)
recursive_fibonacci(n-1)+([recursive_fibonacci(n-1)[-2]+recursive_fibonacci(n-1)[-1]])
# +([recursive_fibonacci(n-1)[-1]]+[recursive_fibonacci(n-1)[-2]])
#fibonacci(n)=fibonacci(n-1) +=(fibonacci(n-1)[-1]+fibonacci(n-1)[-2])
end
p recursive_fibonacci(1)
p recursive_fibonacci(6)


#binary search written recursively
def bsearch(arr,target)
# p arr
return nil if arr.length==1 && target != arr[0]
mid =arr.length/2 # 3,1,1,0
# if arr.length==1 && arr[0] != target
#     return nil
# end


if target==arr[mid]

return mid
elsif target<arr[mid]
    left_index = 0
    right_index = mid-1
    return bsearch(arr[left_index..right_index],target)
#    return bsearch(arr.take(mid),target)
else
    left_index = mid+1
    right_index = arr.length-1
    sub_position=bsearch(arr[left_index..right_index],target)
    # sub_position=bsearch(arr.drop(mid+1),target)
    return sub_position.nil? ? nil : (mid+1)+sub_position 

end
end
# bsearch left, bsearch right
#



def bsearch(nums, target)
    # nil if not found; can't find anything in an empty array
    return nil if nums.empty?
  
    probe_index = nums.length / 2
    case target <=> nums[probe_index]
    when -1
      # search in left
      bsearch(nums.take(probe_index), target)
    when 0
      probe_index # found it!
    when 1
      # search in the right; don't forget that the right subarray starts
      # at `probe_index + 1`, so we need to offset by that amount.
      sub_answer = bsearch(nums.drop(probe_index + 1), target)
      sub_answer.nil? ? nil : (probe_index + 1) + sub_answer
    end
  
    # Note that the array size is always decreasing through each
    # recursive call, so we'll either find the item, or eventually end
    # up with an empty array.
  end
p "result"
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(arr)
    #merge_sort([2,5,6,1,1,7])
    #left = [2,5,6] right = [1,1,7]
    #left=2 right=5,6 left=1 right =1,7
    #       left = 5 right = 6
    #merge_sort([2,5,6])
    return arr if arr.length<=1
    mid=arr.length/2 # 3,1
left = arr[0...mid] # [2,5,6],[2]
right=arr[mid..-1] # [1,1,7],[5,6]
merge_sort(left)
merge_sort(right)
merge(left,right,arr) 
end

def merge(arr1,arr2,orig)
   i=0
   j=0
   k=0
   while i < arr1.length && j <arr2.length
if arr1[i]<=arr2[j]
orig[k]=arr1[i]
i+=1
else 
    orig[k]=arr2[j]  
    j+=1
end
k+=1
end
while i< arr1.length
        orig[k]=arr1[i]
        i+=1
        k+=1
    end

    
    while j< arr2.length
        orig[k]=arr2[j]
        j+=1
        k+=1
        end
    orig
end
p merge_sort([1,7,9,4,3,1])
# p merge([1,3,7],[2,6,8],[1,2,3,7,8,6])


def subsets(arr)
   return [arr] if arr.empty?
   extra=subsets(arr[0...-1]).map do |ele|
ele << arr.last   
end
return subsets(arr[0...-1])+extra
#    return subsets(arr[0...-1])+
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(array)
    #[1,2]
return [array] if array==[1]




previous=permutations(array[0...-1])
last = array.last
result=[]
previous.each do |ele|
    (0...array.length-1).each do |i|
        result << ele[0..i]+[last]+ele[i+1..-1]
    
    
    end
    result << [last]+ele

    end
    result
end



p "result"


p permutations([1]) # [[1]]
p permutations([1,2]) # [[1,2],[2,1]]
p permutations([1,2,3]) # [[1, 2, 3], 
# [2, 1, 3],
# [3, 2, 1]] 
# [3, 1, 2], 
# [1, 3, 2],  [2, 3, 1], 

def make_greedy_coin(remainder,arr=[50,25,10,5,1])
i=0
result=[]
while i < arr.length
if remainder - arr[i]<0
i+=1
else
    result << arr[i]
    return result+make_greedy_coin(remainder-arr[i])
end

end
return result
end
p make_greedy_coin(180)

def make_better_change(remainder,arr=[50,25,10,5,1])
final_result=[]
if remainder    
result=[]
    arr.each.with_index do |coin,i|
        if remainder-coin>0
        result << coin
        end
return result + make_better_change(remainder-coin,arr[i..-1])
end
return final_result
end
p make_better_change(180)