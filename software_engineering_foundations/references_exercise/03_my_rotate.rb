# Write a method, my_rotate!(array, amt), that accepts an array and a number as args.
# The method should mutate the array by rotating the elements 'amt' number of times. 
# When given a positive 'amt', a single rotation will rotate left, causing the first element to move to the last index
# When given a negative 'amt', a single rotation will rotate right, causing the last element to move to the first index
# The method should return the given array.
# Do not use the built-in Array#rotate
# 
# Note: this method must MUTATE the input array. This means that the object_id of the input array should be identical
# to the object_id of the returned array. The exact object_ids you get back don't matter. We just want the ids
# to be the same before and after calling your method.


def my_rotate!(array, amt)

    (0..array.length-1).each do |i|
        if amt<0
        if array[i]-amt<array.length
            temp = array[i]
            temp2=array[i-amt]
            array[i-amt]=temp
        else
        end
        end

        if amt>0
        
        end

    end
end
# if mover is positive 
#     if mover+index< array_size =>newindex =old_index+mover
#     else mover+index>=array_size => newindex = mover-old_index



# if mover is negative
#     if index>=-1*mover => newindex = old_index-mover
#     else if index<-1*mover=>array_size+old_index+mover

/if amt<0:
index = array.length+1
length 0,1,2,3
add them if sum of indices<length
0,+2 =>2
1,+2=>3
if sum of indices>=length: subtract them
2,+2=>0
3,+2=>1


0,1,2,3 amt:-3
0,-3=>1-4
1,-3=>2-4
2,-3=>3-4
3,-3=>0

        
2,-3,4

/

array_1 = ["a", "b", "c", "d"]
p array_1.object_id                 # => 70354216023780
result_1 = my_rotate!(array_1, 2)
p result_1                          # => ["c", "d", "a", "b"]
p result_1.object_id                # => 70354216023780


array_2 = ["NOMAD", "SOHO", "TRIBECA"]
p array_2.object_id                 # => 70354216019660
result_2 = my_rotate!(array_2, 1)
p result_2                          # => ["SOHO", "TRIBECA", "NOMAD"]
p result_2.object_id                # => 70354216019660


array_3 = ["a", "b", "c", "d"]
p array_3.object_id                 # => 70354216016500
result_3 = my_rotate!(array_3, -3)
p result_3                          # => ["b", "c", "d", "a"]
p result_3.object_id                # => 70354216016500
