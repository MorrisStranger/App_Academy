
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
    def self.valid_pos?(pos)
        x, y = pos
        x.between?(0,7) && y.between?(0,7)
    end
    def initialize
        #setup black pieces
        @rows = Array.new(8) {Array.new(8)}
        [0,7].each {|i| @rows[0][i]=Rook.new(:black,self,[0,i]) }
        [1,6].each {|i| @rows[0][i]=Knight.new(:black,self,[0,i]) }
        [2,5].each {|i| @rows[0][i]=Bishop.new(:black,self,[0,i]) }
        @rows[0][3]=Queen.new(:black,self,[0,3])
        @rows[0][4]=King.new(:black,self,[0,4])
        (0..7).each {|i| @rows[1][i]=Pawn.new(:black,self,[1,i]) }
        

        #setup white pieces
        [0,7].each  {|i| @rows[7][i]=Rook.new(:white,self,[7,i]) }
        [1,6].each {|i| @rows[7][i]=Knight.new(:white,self,[7,i])}
        [2,5].each {|i| @rows[7][i]=Bishop.new(:white,self,[7,i])}
        @rows[7][3]=Queen.new(:white,self,[7,3])
        @rows[7][4]=King.new(:white,self,[7,4])    
        (0..7).each {|i| @rows[6][i]=Pawn.new(:white,self,[6,i]) }

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
# p board[[7,6]] #black not working
# p board[[7,0]].moves 


if __FILE__==$PROGRAM_NAME
    board=Board.new()
    board.move_piece([1,0],[2,2])
    board.move_piece([3,6],[3,4])
    board.move_piece([2,2],[3,4])
    p board[[3,4]]
    p board[[1,0]]
    p board[[2,2]]
    p board[[3,6]]
end
# p board[[2,2]].moves
# p board[[1,0]]
# bug for side attacks for side pawn only on right pawns (7,1 and 7,6)
#bug for 1,1 moves

# test pawn capture, knight not able to take a pawn