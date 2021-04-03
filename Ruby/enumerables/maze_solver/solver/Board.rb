require_relative("Tile")
require "byebug"

class Board
    POSITIONS = [
        [0,1],
        [1,0],
        [0,-1],
        [-1,0]
    ]
    attr_reader :board, :start_pos, :end_pos
    def initialize()
        @solved = false
        @board = read_board()
        @start_pos = find_pos("S")
        @end_pos = find_pos("E")

    end
    def read_board(file = "../mazes/maze1.txt")
        # self.new
        f = File.open(file)
        tiles = f.readlines
        tiles = tiles.map {|row| row.delete("\n").split("").map {|tile|Tile.new(tile,self)}}
        self.new(tiles)
    end
    def solved?
        @solved
    end
    def show_board
        @board.each do |row|
        p row.map{|ele| ele.value}
        end
    end
    def find_pos(val)
        @board.each_index do |i| 
            @board[i].each_index {|j| return [i,j] if self[[i,j]] == val}
           
        end
        "hello"


    end
    
        def brute_force()
            # show_board
    #         pos = @start_pos
    #         until 
    #         POSITIONS.each do |position|
    #             new_pos = pos.map.with_index { |v, i| v + position[i] }
    #             if self[new_pos] == " "
    #             self[new_pos]="X"
    #             pos = new_pos
    #             break
    #             end

    #             #add position to current position
    #     end
    #     # here is where none are equal to blank

    end


            # debugger
            # POSITIONS.each do |position|
     
            #     new_pos = pos.map.with_index { |v, i| v + position[i] }#add position to current position
            #     return pos if self[new_pos] =="E" # doesnt matter what is returned
            #     next if self[new_pos]=="X"
            #     if self[new_pos] == " "

            #         self[new_pos]="X"
            #         return brute_force(new_pos)
             
            #     end
            #     self[pos]=" "
            #      return brute_force(new_pos)
                
            # end

        
                
            
    def [](pos)
        x, y = pos[0], pos[1]

        @board[x][y].value
    end
  
    def []=(pos,value)
        x, y = pos[0], pos[1]
        @board[x][y].value= value
    end
    def visited(pos)
        x, y = pos[0], pos[1]
        @board[x][y].visited
    
    end
    def visited_set(pos,value)
        x, y = pos[0], pos[1]
        @board[x][y].visited=value
    
    end

end

if __FILE__ == $PROGRAM_NAME
    a=Board.new()
    a.show_board
    # a=Board.read_board()

    # p a
    # p a.start_pos
    # p a.end_pos
    # a.brute_force()
    # a.show_board

    # p a.board
end