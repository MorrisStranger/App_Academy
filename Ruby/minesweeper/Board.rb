require_relative "Tile.rb"
class Board
    # attr_accessor :grid
    def initialize()
        # create_board
        # @grid=grid
        
    end
    
    def create_board
        number_of_bombs=3
        @grid=Array.new(9) do 
            Array.new(9) {Tile.new(self)}
        end
        indices_i=Array.new(9) {(0..8).to_a}.flatten
        indices_j=Array.new(9) {(0..8).to_a}.flatten

        number_of_bombs.times do 
        i=indices_i.sample
        j=indices_j.sample
        
        # if !already_seen.include?([i,j])
            @grid[i][j].makebomb
        # end
        indices_i.delete_at(indices_i.find_index(i))
        indices_j.delete_at(indices_j.find_index(j))
            # already_seen << [i,j]
        end
        @grid

    end
    # def grid
    # @grid
    # end
    def [](pos)
    x,y=pos
    @grid[x][y]
    end
def grid
    @grid
end
# def render

# end
end
# p newboard

# p newboard[[0,1]].neighbor_bomb_count
# p newboard.grid
