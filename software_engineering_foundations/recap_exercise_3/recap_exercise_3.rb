require "byebug"
def no_dupes?(arr)
unique=[]
newhash=Hash.new(0)

arr.each {|ele| newhash[ele]+=1 }
arr.select {|ele| ele if newhash[ele]==1}
end
# p no_dupes?([true, true, true])

def no_consecutive_repeats?(arr)
    return true if arr.length ==1
    
(0...arr.length-1).all?{|i| arr[i]!=arr[i+1] }
end
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog']) 
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])

def char_indices(str)
    charhash = Hash.new { |h,k|h[k]=[]}
    str.each_char.with_index {|char,i| charhash[char] << i}
    charhash
end
p char_indices('mississippi')
p char_indices("classroom")

def longest_streak(str)
longest=""
strarr =[]
(0...str.length-1).each do |i|
if str[i]==str[i+1]
longest+=str[i]
else
    longest+=str[i]
    
    strarr << longest
    longest=""
end
end
strarr.all? {|strchar| return str[-1] if strchar.length==1 }

counter = ""
strarr.each do |ele| 
if ele.length>counter.length
counter = ele
end

end
counter
end
# if longest==""
#     longest=str[-1]
#     return longest
# end

# end
p longest_streak('a')
p longest_streak('accccbbb')
p longest_streak('aaaxyyyyyzz')
p longest_streak('aaabbb') 
p longest_streak('abc')
#loops through string keeping track of longest streak until it is overtaken
#have longest variable as the current longest string
#if overtaken by another string update to that string


def bi_prime?(num)
    # debugger
    (1..num).any?{|ele| (is_prime?(ele) && is_prime?((num.fdiv(ele))))}

end

def is_prime?(num)
    if num.is_a?(Float) || num <2
    return false
end
    
(2..num-1).none?{|ele| num% ele == 0 }
end
p bi_prime?(14)
p bi_prime?(22)
p bi_prime?(25)
p bi_prime?(24)
# p is_prime?(24/5.to_f)
#differentiate 7.0 from 7.4
