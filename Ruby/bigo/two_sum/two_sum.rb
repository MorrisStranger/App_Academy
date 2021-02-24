def bad_two_sum?(arr,target_sum)#time complexity O(n^2)
    # O(1) space
    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|

            return true if (arr[i]+arr[j])==target_sum

        end

    end
false
end

arr = [0,1,5,7]
# p bad_two_sum?(arr,6)
# p bad_two_sum?(arr,10)


def okay_two_sum?(arr,target_sum)#sort is time complexity O(nlogn)
    arr.sort!
=begin    
#binary search will say if the arr mid element can be summed
with any other element to get the target_sum
we want to find this out for each element by starting 
=end
arr.drop(1).any? {|ele| target_sum ==arr.first+ele }  || (1...arr.length-1).any? {|index| #(O(n)+O(nlogn)+O(n)=O(nlogn)
binary_search(arr,target_sum,index)

} || arr.take(arr.length-1).any? {|ele| target_sum==arr.last+ele}
    
end


=begin
binary_search should return whether mid_element+any_other_element=target_sum
base case:
if arr.length==2 return target_sum==arr[0]+arr[1]
    if target_sum/2.0 is less than middle element then:

        return bsearch(second half of array)
    if target_sum/2.0 is greater than middle element then:
        return bsearch(first half of array)

        we do this till we get 
end
one above base _case:

binary_search([1,2,3],3) == binary_search([1,2],3)

binary_search([1,2],3)
=end

def binary_search(arr,target_sum,mid_index=arr.length/2)
    return target_sum == arr[0]+arr[1] if arr.length ==2
    if arr[mid_index]<target_sum/2.0
    binary_search(arr[mid_index..-1],target_sum)
    elsif arr[mid_index]==target_sum/2.0
        new_arr=arr.dup
        deleted=new_arr.delete_at(mid_index)
        return new_arr.include?(deleted)
    else
        binary_search(arr[0..mid_index],target_sum)
    end
end

# p okay_two_sum?([1,2,3,5],6)
# p okay_two_sum?([1,2,3],5)
# p okay_two_sum?([1,3],5)
# p okay_two_sum?([4,3,1],8)

def best_two_sum?(arr,target_value)
    #O(n)
    hashm=arr.inject(Hash.new {0}) {|acc,ele| acc[ele]+=1;acc}
    #O(n)# because has_key? is O(1) as get methods are and looping through each key
    hashm.any? {|k,v|hashm.has_key?(target_value-k) && target_value-k!=k || target_value-k==k && v>1}

end
p best_two_sum?([2,3,3,4],8)#false
p best_two_sum?([1,2,3,5],6)#true
p best_two_sum?([1,2,3],5)#true
p best_two_sum?([1,3],5)#false
p best_two_sum?([4,3,1],8)#false
p best_two_sum?([5,3],10)#false
p best_two_sum?([5,5],10)#true 