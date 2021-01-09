class Hangman
DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

def self.random_word
DICTIONARY.sample


end
def initialize()
@secret_word = Hangman.random_word
@guess_word = Array.new(@secret_word.length) {"_"}
@attempted_chars = Array.new
@remaining_incorrect_guesses = 5
end
def guess_word
  @guess_word
end
def attempted_chars
@attempted_chars
end
def remaining_incorrect_guesses
@remaining_incorrect_guesses
end
def already_attempted?(char)
if attempted_chars.include?(char)

  true
else
  false
end

end
def get_matching_indices(char)
  indices=[]
@secret_word.each_char.with_index do |ele,i| 

  if ele==char
  indices << i
  end
end
indices
end
def fill_indices(char,ind_arr)
ind_arr.each {|idx| @guess_word[idx]=char}
  
end
def try_guess(char)
if get_matching_indices(char).empty?
  @remaining_incorrect_guesses -=1
end

if already_attempted?(char)
p 'that has already been attempted'
false
else
  @attempted_chars << char
  fill_indices(char,get_matching_indices(char))
  true
end
end
def ask_user_for_guess
p "Enter a char:"
try_guess(gets.chomp)
end
def win?
if @secret_word===@guess_word.join("")
p "WIN"
true
else
  false
end

end
def lose?
  if @remaining_incorrect_guesses==0
    p "LOSE"
    true
  else
    false
  end
end
def game_over?
if win? || lose?
  p @secret_word
  true
else
  false
end
end
end