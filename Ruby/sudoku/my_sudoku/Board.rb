require_relative("Tile.rb")
require "matrix"
require "byebug"
class Board
    POSSIBLE_VALUES=(1..9).to_a
    attr_accessor :grid
def initialize(grid)
    @grid = grid
end
def self.from_file(file)
    arr=[]
    grid=[]
    board = File.readlines(file)[0..-1].map do |line|
            a = line.strip.split("")[0..-1]
            
        a.each do |ele|
            given = (ele.to_i ==0 ? false : true)
            arr << Tile.new(ele.to_i, given)
        end
        grid<<arr
        arr=[]
        end
        # print(result)

        Board.new(grid)
        
            # print(arr)
end

def rows_solved?
value_grid.all? {|ele| ele.sort==POSSIBLE_VALUES}
end
def cols_solved?
mat = Matrix[*value_grid]
(0...value_grid.length).all?{|i| mat.column(i).to_a.sort==POSSIBLE_VALUES}
end
def squares_solved?
turn_to_3by3.all? {|ele|ele.sort==POSSIBLE_VALUES}
end
def solved?
(rows_solved? && squares_solved?) && cols_solved?
end
def turn_to_3by3 # get a 3by3 for each
arr = []
result=[]

[3,6,9].each do |ele|
    [3,6,9].each do |ele2|
        (ele-3...ele).to_a.each do |i| # t
            (ele2-3...ele2).to_a.each do |j|
                arr << value_grid[i][j]
            end
        end
        result << arr
        arr =[]
    
    end

  
end
result
end

# def update(position,value)
# @grid[position[0]][position[1]]=Tile.new(value,false)
# end
def update(position,value)
@grid[position[0]][position[1]]=Tile.new(value,false)
end
# def [](pos)
# @grid[position[0]][position[1]]
# end
# def []=(pos) 
# @grid[position[0]][position[1]]=value
# end
def value_grid
    arr=[]
    result=[] 
    @grid.each do |row| 
        row.each do |tile|
            
            arr << tile.value
        end
            result << arr
            arr = []
    end
    # p result
    result
    
end


def string_grid
    arr=[]
    result=[]
@grid.each do |row| 
    row.each do |tile|
        # p tile
        # p (tile.to_s(tile.value))
        arr << (tile.to_s(tile.value))
        # p arr
        end
        result << arr
        arr = []
        
    end
    result

end
def render
    # print(string_grid)
  string_grid.each.with_index do |row,i|
    row.each.with_index do |ele,j|
        if ele != ""
            print ele  
            print " "
        else
            print "_"
            print " "
        end
        if (j+1) % 3 ==0
            print "|"
        end
        end
    puts
    if (i+1) %3 ==0
        puts "---------------------"
    end
  end
end
end

# a= Board.new([])
#a =Board.from_file("sudoku1.txt")
# a=Board.from_file("sudoku1.txt")
# a.render
