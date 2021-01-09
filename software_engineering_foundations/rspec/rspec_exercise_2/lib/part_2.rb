def palindrome?(str)
i=str.length-1
j=0
while i>=0
 if str[i]!=str[j]
    #  puts false
     return false
 end
 i-=1
 j+=1
end
# puts true
return true

end


str = "hello"
p str[0..0]

def substrings(str)
i=0
j=0
arr=[]
while i<str.length
    while j<str.length
    arr.push(str[i..j])
        j+=1
    end
    i+=1
    j=i
end
return arr
end

def palindrome_substrings(str)
substrings(str).select {|ele| palindrome?(ele) && ele.length>1
}

end
