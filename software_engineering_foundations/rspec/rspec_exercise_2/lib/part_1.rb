def partition(arr,num)


first = []
second = []
meta=[]
arr.each {|ele| ele<num ? first.push(ele) : second.push(ele) }
# [first,second]
meta.push(first,second)
p meta
end

partition([1,2,6,7],3)


def merge(hash1,hash2)
mergehash={}
hash1.each {|k,v| mergehash[k]=v}
hash2.each {|k,v| mergehash[k]=v}

return mergehash
end

# def censor(sentence,bad_arr)
# sentence.downcase.split(" ").map do |ele| 

# if bad_arr.include?(ele) 
# ele.map()"aeiou"
# end
# end
# end
# censor("SHUT THE FRONT DOOR", ["door","best"])

def censor(sentence,bad_arr)
vowels="AEIOUaeiou"
lowersentence = sentence.lowcase
i=0
while i<bad_arr.length
lowersentence[bad_arr[i]]each.lowcase[]
i+=1
end
#  censor("SHUT THE FRONT DOOR", ["door","shut"]) =>("SH*T THE FRONT D**R")
end

p Array.new(15,2)

def power_of_two?(num)
    sum=2
    a = Array.new(num,2)
a.each do |ele|  
    sum=sum*ele
    return true if num==sum or num==1
end
return false
end
power_of_two?(16)