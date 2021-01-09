def my_map(arr,&prc)

new_arr =[]


arr.each {|ele| new_arr << prc.call(ele)}
new_arr
end


def my_select(arr,&prc)
new_arr = []
arr.each do |ele|
 if prc.call(ele)
new_arr <<  ele
 end
end
new_arr
end

def my_count(arr,&prc)
counter = 0
    arr.each {|ele| 
    if prc.call(ele)
counter+=1
    end}
counter
end

def my_any?(arr,&prc)
arr.each do |ele|
if prc.call(ele)
return true
end

end
false
end

def my_all?(arr,&prc)
    
    arr.each do |ele|
        if !prc.call(ele)
        return false
        end
        
        end
        true
end

def my_none?(arr,&prc)
    arr.each do |ele|
        if prc.call(ele)
        return false
        end
        
        end
        true
end