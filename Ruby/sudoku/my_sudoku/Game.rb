require_relative("Board.rb")
require_relative("Tile.rb")
require "matrix"

class Game
def initialize(board)
@board = board
end
def play
    until @board.solved?
        system("clear")
@board.render
p "enter a number"
value=gets.chomp.to_i
if !((1..9).to_a).include?(value)
    p "enter a number between 1-9"
    sleep(3)
else
p "enter a position"
pos = gets.chomp
pos = [pos[1].to_i,pos[3].to_i]

# if !((1..9).to_a).include?(value)
#     p "please enter a number from 1 to 9"
#     sleep(3)
# end
if @board.grid[pos[0]][pos[1]].given 
    p "please pick a new value, number is given"
    sleep(3)


else
    @board.update(pos,value)

    
end
    end
end
p "you solved it"
end
end
# newboard=Board.from_file("sudoku1.txt")
# newgame=Game.new(newboard)
# newgame.play
