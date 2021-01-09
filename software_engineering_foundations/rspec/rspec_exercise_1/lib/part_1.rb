def average(num_1,num_2)
return (num_1+num_2)/2.0
end

def average_array(array)
array.inject {|sum,ele| sum+ele}/array.length.to_f
end

# def repeat(str,num)
# return .times
# end
def repeat(str,num)
return str*num
end

def yell(str)
return str.upcase+"!"
end

def alternating_case(sentence)
arr= sentence.split(" ")
    arr.map!.with_index do |ele,i| 
    i % 2 == 0 ? (ele.upcase) : (ele.downcase) 
    
    end
return arr.join(" ")
end

