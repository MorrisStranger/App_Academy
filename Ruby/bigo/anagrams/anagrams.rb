   def first_anagram?(string)
        anagrams=[]
        return [string] if string.length <=1                                 
        anagrams += (first_anagram?(string[1..-1])).map  do |word|
            (0...string.length).map {|i| word[0...i] + string[0] + word[i..-1] }
        end
        anagrams.flatten
       
    end
    def anagram?(str1,str2)# time complexity is O(n! where n is length of first string)
        first_anagram?(str1).include?(str2)
            

    end

# p first_anagram?("ab")
# p anagram?("gizmo", "sally")   
# p anagram?("elvis", "lives")

def second_anagram?(str1,str2)#time complexity is O(n) space is O(n)
    arr2=str2.split("")
    str1.each_char do |char|
        
        arr2.delete_at(arr2.find_index(char))
    end
    # p arr2
    arr2.empty?
end
# p second_anagram?("helloworld","elloworldh")
# p anagram?("helloworld","elloworldh")

def third_anagram?(str1,str2)#uses quicksort O(nlogn) space is O(n) 
quicksort_char(str1)==quicksort_char(str2)
end
def quicksort_char(str)
    return str if str.length<=1
    h = Hash[("a".."z").zip (0..25)]
    values=[*str.split("")].map{|i|h[i]}
    first=values[0]
    before = values.select {|ele| first > ele  }
    after  = values.select {|ele| first < ele  }
    quicksort_char(before.map{|i|h.key(i)}.join(""))  + h.key(first) \
    + quicksort_char(after.map{|i|h.key(i)}.join(""))

end

p third_anagram?("gizmo", "sally")   
p third_anagram?("elvis", "lives")


def fourth_anagram?(str1,str2)#time complexity is O(n) space is O(n)
   h1 = Hash.new{|hash,key| hash[key]=0}
   h2=h1.dup
   str1.each_char {|char| h1[char]+=1}
   str2.each_char {|char| h2[char]+=1}
   h1==h2
#    str1.each {|char| }
end

p fourth_anagram?("hell","lleh")

def fifth_anagram?(str1,str2)
h1 = Hash.new{|hash,key| hash[key]=0}
str1.each_char {|char| h1[char]+=1}
str2.each_char {|char| h1[char]-=1}
h1.values.all?{|i|i==0} 

end
p "hi"
p fifth_anagram?("hell","lleh")


def bitwise_anagram?(str1,str2)
    (str1+str2).bytes.inject(:^)==0
   
end
p bitwise_anagram?("hell","lleh")
