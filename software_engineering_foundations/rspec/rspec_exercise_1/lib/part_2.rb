def hipsterfy(word)
    word.reverse.each_char.with_index do |ele,i| 
        if ["a","e","i","o","u"].include?(ele)
            answer = i
            
            word.slice!(word.length-answer-1)
            return word

        end
    
    end
   return word
end
# hipsterfy("rhythm")


def vowel_counts(str)
    hash={}
    sum=1
    str=str.downcase.chars.sort.join
    (1...str.length).each do |ele|
    if str[ele]==str[ele-1]
        sum+=1
        if ele==str.length-1
            hash[str[ele]]=sum
        end
    else
        hash[str[ele-1]]=sum
        sum=1
    end
    end

    return hash
end


def caesar_cipher(message,n)

    letter_array=("a".."z").to_a
    letter_array_2 = letter_array.rotate(n)
# (0...letter_array.length-n).each {|idx| newhash[letter_array[idx]]= letter_array[idx+n]}
h = Hash[letter_array.zip letter_array_2]
# puts newhash
return message.chars.map!  {|letter| 
 letter_array.include?(letter) ?letter=h[letter] :letter
}.join("")



end

caesar_cipher("hello",2)


p Hash.new(0)