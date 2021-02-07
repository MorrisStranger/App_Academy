
require_relative "Rook"
require_relative "Knight"
require_relative "Bishop"
require_relative "Queen"
require_relative "King"
require_relative "Pawn"
require_relative "NullPiece"

# pieces need own pos = method to recognise themselves when their position has changed from board and update it. 
# pawn need to only attack there if there is a piece
# rewrite slideable module to be cleaner
# rewrite Board.initialize method
class Board
    attr_reader :rows
    def initialize
        #setup black pieces
        @rows = Array.new(8) {Array.new(8)}
        [0,7].each {|i| @rows[i][0]=Rook.new(:black,self,[i,0]) }
        [1,6].each {|i| @rows[i][0]=Knight.new(:black,self,[i,0]) }
        [2,5].each {|i| @rows[i][0]=Bishop.new(:black,self,[i,0]) }
        @rows[3][0]=Queen.new(:black,self,[3,0])
        @rows[4][0]=King.new(:black,self,[4,0])
        (0..7).each {|i| @rows[i][1]=Pawn.new(:black,self,[i,1]) }
        

        #setup white pieces
        [0,7].each  {|i| @rows[i][7]=Rook.new(:white,self,[i,7]) }
        [1,6].each {|i| @rows[i][7]=Knight.new(:white,self,[i,7])}
        [2,5].each {|i| @rows[i][7]=Bishop.new(:white,self,[i,7])}
        @rows[3][7]=Queen.new(:white,self,[3,7])
        @rows[4][7]=King.new(:white,self,[4,7])    
        (0..7).each {|i| @rows[i][6]=Pawn.new(:white,self,[i,6]) }

        #fill up rest of board with nulls
        @rows.each.with_index do |row,i|
            row.each.with_index do |ele,j|
                @rows[i][j]= NullPiece.instance if !ele
            end
        end
    

    end
    def move_piece(start_pos,end_pos)
        raise "no piece at position #{start_pos}" if self[start_pos].empty?
           
        # elsif piece cannot move to end_pos
        #     raise "piece cannot move to end_pos"
        raise "cannot move there" if !self[start_pos].moves.include?(end_pos)
        piece=self[start_pos]
        self[end_pos]=piece
        piece.pos=end_pos
        self[start_pos]=NullPiece.instance
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
board=Board.new()
# p board.rows
# board[[0,0]]=Bishop.new(:black,board,[0,0])
# p board.rows
# p board[[1,0]].moves # check properly - remove negatives using super method valid_moves?
# p board[[0,1]].moves # check properly - pawn method is wrong
# p board[[1,1]].moves #weird bug for 1;1
# p board[[7,1]].moves # nil class coming up!
p board[[7,6]] #black not working
# p board[[7,0]].moves 

board=Board.new()
board.move_piece([1,0],[2,2])
p board[[2,2]].moves
p board[[1,0]]
# bug for side attacks for side pawn only on right pawns (7,1 and 7,6)
#bug for 1,1 moves