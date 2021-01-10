require "set"
class WordChainer
   
    
   
def initialize(dictionary_file_name)
    dict=[]
    i=1
    File.open(dictionary_file_name).each_line{ |s|
      i+=1
      dict<<s.strip
    } 
    @dictionary =dict.to_set
end
def adjacent_words(word)
    #returns an array of words adjacent to word
    #change each character of word
    adjacents=[]
    word.each_char.with_index do |char,i|
    ("a".."z").each do |letter|
        new_word=word.dup
       if letter !=new_word[i] 
        new_word[i]=letter 
        adjacents << new_word if @dictionary.include?(new_word)

    end
    end
    end
    #if dictionary.include?(word)
    adjacents


end
def explore_current_words
    new_current_words=[]
    @current_words.each do |current_word|
        adjacent_words(current_word).each do |adjacent_word|
        if !@all_seen_words.include?(adjacent_word)
            new_current_words << adjacent_word
            @all_seen_words[adjacent_word]=current_word

        end
    end
end


@current_words=new_current_words

end
    def run(source,target)
        @current_words=[source]
        @all_seen_words={source =>nil}
        while !@current_words.empty? && !@all_seen_words.include?(target)
            explore_current_words
    end
    # p "all the words in total"
    # p @all_seen_words
    self.build_path(target)
end
def build_path(target)
path=[]
key = target
path << target
while @all_seen_words[key] != nil
    # p @all_seen_words
    path << @all_seen_words[key]
    key = @all_seen_words[key]
    # p key
end
return path.reverse
end
end
chainer=WordChainer.new("./dictionary.txt")
# p chainer.adjacent_words("cat")
p chainer.run("duck", "ruby")