def reverser(str,&prc)
newstr=""
    i=-1
    while i>=-1*str.length
    newstr << str[i]
    i-=1
    end
    prc.call(newstr)
end

def word_changer(sentence,&prc)
    new_arr=[]
sentence.split(" ").each {|word| new_arr<< prc.call(word)

}
new_arr.join(" ")
end

def greater_proc_value(num,prc1,prc2)
if prc1.call(num)>prc2.call(num)
    prc1.call(num)
else
    prc2.call(num)
end
end

def and_selector(arr,prc1,prc2)
arr.select do |ele|
    ele if prc1.call(ele) && prc2.call(ele)
        

end
end

def alternating_mapper(arr,prc1,prc2)
    arr.map.with_index {|ele,i| i % 2 ==0 ?prc1.call(ele) :prc2.call(ele)}
end