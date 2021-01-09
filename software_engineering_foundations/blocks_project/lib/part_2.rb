require "byebug"
def all_words_capitalized?(wordarr)
    # debugger
    wordarr.all? do |word| 
        word.capitalize==word
    end
end

def no_valid_url?(urlarr)
urlarr.none? {
   
|url|
# debugger
 endingvalid?(url) }
end

def endingvalid?(url)
endings=['.com', '.net', '.io', '.org']
endings.one? {|ending| url.include?(ending)}
end

def any_passing_students?(hasharr)
    # debugger
    hasharr.any? {|hash| average(hash[:grades])>=75}
end

def average(arr)
arr.inject {|acc,ele| acc+ele}/arr.count.to_f
end

p average([1,2,3,4,5])