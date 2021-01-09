require_relative("Card.rb")
require_relative("Board.rb")

class Game
    attr_accessor :previous_guess
    attr_accessor :board
def initialize(board)
    @board = board
    @previous_guess = [] 
end
def play
    until @board.won?
    system("clear")
    @board.render
    p "guess a position"
    guessed_pos = gets.chomp
    guessed_pos = [guessed_pos[1].to_i,guessed_pos[3].to_i]
    p @previous_guess
    make_guess(guessed_pos)
    p @previous_guess

end
end
def make_guess(pos)
    if @previous_guess.empty?
   @board.reveal(pos)
   @previous_guess = pos
    elsif self.board.grid[pos[0]][pos[1]].val == self.board.grid[@previous_guess[0]][@previous_guess[1]].val
        @board.reveal(pos)
        @previous_guess=[]
        else
            @board.reveal(pos)
            sleep(5)
            self.board.grid[pos[0]][pos[1]].hide
            self.board.grid[@previous_guess[0]][@previous_guess[1]].hide
            @previous_guess=[]
        end  
end
end
if __FILE__ == $PROGRAM_NAME
# newboard=Board.new(4)
newboard=Board.new(4)

newgame=Game.new(newboard)
newboard.populate
newboard.render
newgame.play
end