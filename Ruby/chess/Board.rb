require_relative "Piece.rb"

class Board
    attr_reader :rows
    def initialize
        # initial_setup=[Piece.new(),]
        @rows = Array.new(8) {Array.new(8)}
        (0..7).each do |i|
            [0,1,6,7].each do |j|
                @rows[i][j]=Piece.new
            end
        end
    end
    def move_piece!(start_pos,end_pos)
        if !self[start_pos]
            raise "no piece at position #{start_pos}"
        # elsif piece cannot move to end_pos
        #     raise "piece cannot move to end_pos"
        end
        piece=self[start_pos]
        self[end_pos]=piece
        self[start_pos]=nil
    end
    def [](pos)
        x,y=pos
        rows[x][y]
    end
    def []=(pos,val)
        x,y=pos
        rows[x][y]=val
    end
    #might delete
    # def []==(pos,val)
    #     x,y=pos
    #     rows[x][y]==val
    # end
end
# board=Board.new()
# board[[0,0]]=Bishop.new(:black,board,[0,0])
# p board.rows