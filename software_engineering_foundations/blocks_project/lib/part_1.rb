require "byebug"
def select_even_nums(arr)
arr.select{|ele| ele if ele %2 ==0}
end

def reject_puppies(hasharr)
   hasharr.reject do |hash|
        hash["age"]<3
        
    end
   
end
def count_positive_subarrays(arr_twod)
    a=arr_twod.count
    arr_twod=arr_twod.select {|ele| ele.sum>0}
arr_twod.count
end

def aba_translate(word)
vowels=["a","e","i","o","u"]
    word.split("").map do |char|
        # debugger
if vowels.include?(char)
    char+"b"+char
else char
end
end.join("")
end

def aba_array(wordarr)
    wordarr.map {|word| aba_translate(word)}
end