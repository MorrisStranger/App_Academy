# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def is_prime?(number)
    # debugger
    (2...number).each do |ele|
    if number % ele==0
        return false
    end
end
    return true
end

def largest_prime_factor(num)

(2..num).reverse_each do |ele|
    # debugger
    if num % ele == 0 && is_prime?(ele)
        # final=ele
        # return final
        return ele
    end
    
end
end



def unique_chars?(str)
    (1...str.length).each  do |i| 
         
        (0..i-1).each {  |j| 
        # debugger
        return false if str[i]==str[j]}
    end
return true
end


def dupe_indices(arr)
    hash={}
    indices=[]
    (1...arr.length).each do |i|

        (0..i-1).each { |j|
    # debugger
    if arr[i]==arr[j]
        indices.push(j)
        indices.push(i) 
        hash[arr[i]]=indices.uniq.sort
      
    end
    }
    indices=[]

        # indices.uniq
end
hash.uniq.sort.to_h
    end
dupe_indices(["a", "a", "c", "c", "b", "c"])

def ana_array(arr1,arr2)
hash1=Hash.new(0)
hash2=Hash.new(0)
arr1.each do |ele|
    hash1[ele]+=1
end
arr2.each do |ele|
    hash2[ele]+=1
end
hash1==hash2
end