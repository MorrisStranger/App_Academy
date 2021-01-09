# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
    strarray=str.split("")
    counter=1
    counterarray=[]
    finalarray=[]
    (1..strarray.length).each do |i|

        if strarray[i]==strarray[i-1]
            counter =counter+1
            # puts "eachtime"+counter.to_s
        # else
        #     counterarray.push(counter)
        #     counter =1
        else 
            # puts counter   
            counterarray.push(counter)
            counter=1
            
       
    end
    # if counter==1
        # puts counterarray
    # end
# return counterarray
end
i=0
sum=0
while i<counterarray.length
    # p strarray[sum]
    finalarray.push(counterarray[i].to_s+strarray[sum].to_s)
    # finalarray.push((counterarray[i]).to_s+(strarray[counterarray[sum]]).to_s)
    sum +=counterarray[i]
    i=i+1
end
return finalarray.join("").split("1").join("")
# finalarray
end
# /[3,2,1][a,a,a,b,b,c]/

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
