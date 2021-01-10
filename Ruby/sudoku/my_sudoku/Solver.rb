

require_relative("Board.rb")
require_relative("Tile.rb")
class Solver
POSSIBLE_VALUES=(1..9).to_a

    attr_accessor :board
    def initialize(board)
    @board = board
    end

def run
    squares=self.squares

until @board.solved?
    i=0
    iterations=0
    while i < squares.length
        print "iteration: "
        print iterations
        iterations+=1
        
        puts
        @board.render
        sleep(2)
       
       
        i-=2 if !move(squares[i])
    # sleep(3)
    if !value_valid?(squares[i])
    i-=1
    # p "decrement because invalid move"
    end
i+=1
end
end
@board.render
p "number of iterations required"
p iterations
p "solved"
end
def move(pos)
    

    # initial_val=@board.grid[pos[0]][pos[1]].value
    initial_val = @board[pos].value
    if initial_val != 9
    new_val=initial_val+1

@board.update(pos,new_val)
return true
    
    else
        @board.update(pos,0)
       return false
end
end
def row_valid?(pos)
# @board.value_grid[pos[0]].count(@board.value_grid[pos[0]][pos[1]]) <2
@board.value_grid[pos[0]].count(@board[pos].value) <2

end
def col_valid?(pos)
    mat = Matrix[*(@board.value_grid)]
    
    mat.column(pos[1]).count(@board.value_grid[pos[0]][pos[1]]) <2
end
def square_valid?(pos)
    # 3*  (i /3) +  j / 3
@board.turn_to_3by3[3*(pos[0]/3)+pos[1]/3].count(@board.value_grid[pos[0]][pos[1]]) < 2
end
def squares
    arr =[]
    (0...@board.grid.length).each do |i|
        (0...@board.grid.length).each do |j|
            arr << [i,j] if @board.grid[i][j].given==false 
        end
    
    end
arr
end


    def value_valid?(pos)
    #   p "value valid time"
        row_valid?(pos)  && col_valid?(pos) && square_valid?(pos)
    end


end
sudoku1=Board.from_file("../puzzles/sudoku1.txt")
# hardboard= Board.from_file("hardsudoku.txt")
# hardsolver=Solver.new hardboard
# hardsolver.run
sudoku1_solver=Solver.new(sudoku1)
# sudoku2.render
sudoku1_solver.run

# solver.run