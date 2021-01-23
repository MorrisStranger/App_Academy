require "byebug"
# require_relative "Board.rb"
# require_relative "Tile.rb"
class Tile
    attr_reader :bomb
    attr_reader :revealed
    attr_reader :flagged
    @@neighbor_indices=[
        [-1,-1],
        [-1,0],
        [-1,1],
    [0,-1],
    [0,1],
        [1,-1],
        [1,0],
        [1,1]
    ]
  
def initialize(revealed=false,bomb=false,flagged=false,board)
@revealed = revealed
@bomb=bomb
@flagged=flagged
@board=board
# @pos=tile_indices

end
def inspect
# {"pos"=>@pos,
{
"bomb?"=>@bomb,
"flagged?"=>@flagged
}.inspect

end
def flag
@flagged=!@flagged
end
def reveal
@revealed=true
end
def makebomb
@bomb=true
end
# def neighbors
# end
def sum_arrays(arr1,arr2)
    nums = [arr1, arr2]

    nums.transpose.map(&:sum) 
end
def bomb?
self.bomb ? 1 : 0
end
def tile_indices
    @board.grid.each.with_index do |row,i|
        row.each.with_index do |tile,j|
            if @board[[i,j]]==self
            return [i,j]
            end
        end
    end
end
def neighbors
    
    neighbors =[]
    @@neighbor_indices.each do |neighbor|      
    index = sum_arrays(tile_indices,neighbor)
    i,j=index
    if i>=0 && i<=8 && j>=0 && j<=8 
    neighbors << @board[index]
    end
    end
neighbors
end

def neighbor_bomb_count()
# x,y=pos
bomb_sum=0
neighbors.each do |neighbor|
bomb_sum+=neighbor.bomb?

end
bomb_sum
end

end
