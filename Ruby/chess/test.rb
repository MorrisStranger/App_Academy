def deep_dup(arr)
    copy=[]
    arr.each do |ele|
    if !ele.is_a? Array
        copy << ele
    else
        copy << deep_dup(ele)
    end
end
copy

end

