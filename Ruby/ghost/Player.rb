class Player
# attr_reader :name
def initialize(name)
    @name=name
end
def name
@name
end
def guess
    puts "#{self.name}, enter a character to guess"
    guess=gets.chomp
   while !alert_invalid_guess(guess)
    puts "#{self.name}, enter a character to guess"
    guess=gets.chomp
   end
   return guess
end
def alert_invalid_guess(char)
if !("a".."z").to_a.include?(char)

p "warning guess is invalid, please try again"
return false 
else
    return char
end
end

end