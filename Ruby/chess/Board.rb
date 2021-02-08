
require_relative "Rook"
require_relative "Knight"
require_relative "Bishop"
require_relative "Queen"
require_relative "King"
require_relative "Pawn"
require_relative "NullPiece"
require "byebug"

# rewrite slideable module to be cleaner
# rewrite Board.initialize method
#maybe eventually have a loop through all squares written as a proc
#pieces method
# checkmate_method after pieces method using new valid_moves method
#refactor recursive method to run code after recursion instead of 2 functions
# set pieces method to an instance variable to save time
#make sure pawns dont overwrite pawns that are infront of it when it moves forward
class Board
    attr_accessor :rows
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
        # @loop_prc=
        #fill up rest of board with nulls
        @rows.each.with_index do |row,i|
            row.each.with_index do |ele,j|
                @rows[i][j]= NullPiece.instance if !ele
            end
        end
    

    end
    def pieces
        pieces=[]
        @rows.each do |row|
            row.each do |piece|
                pieces << piece
            end
        end
        pieces
    end
    def dup(arr)#8 by 8, 8 by 0
        # debugger
        copy=[]
        arr.each  do |ele| 
            if  ele.is_a? Array
                copy << self.dup(ele)
            else 
                copy << ele 

            end
        end
        copy

    end
    def board_copy
        newboard=self.class.new
        newboard.rows=dup(@rows)
        return newboard
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
    def checkmate?(color)
        color_pieces=pieces.select {|piece| piece.color==color}
        self.in_check?(color) && color_pieces.all? {|piece|piece.valid_moves.empty?}
        # in_check?(color) && pieces.none?valid_moves
    end
    

    def in_check?(color)
        king_pos=find_king?(color)
        @rows.each do |row|
            row.each do |piece|
                return true if !piece.empty? && piece.color != color && piece.moves.include?(king_pos)
            end
        end
        false

        #select pieces where piece.color == black if white or white if blackself.color
    end
    def find_king?(color)
        @rows.each.with_index do |row,i|
            row.each.with_index do |ele,j|
                # p @rows[i][j] is_a? King
                piece=self[[i,j]]
                # p piece.color==color
                # p piece is_a? King
                # p piece.is_a? King
                if (piece.is_a? King) && piece.color==color
                    return [i,j] 
                end
            end
        end
    end
    
end
# board=Board.new()
# p board.rows
# board[[0,0]]=Bishop.new(:black,board,[0,0])
# p board.rows
# p board[[1,0]].moves # check properly - remove negatives using super method valid_moves?
# p board[[0,1]].moves # check properly - pawn method is wrong
# p board[[1,1]].moves #weird bug for 1;1
# p board[[7,1]].moves # nil class coming up!
# p board[[7,6]] #black not working
# p board[[7,0]].moves 


# if __FILE__==$PROGRAM_NAME
#     board=Board.new()
#     board.move_piece([1,0],[2,2])
#     board.move_piece([3,6],[3,4])
#     board.move_piece([2,2],[3,4])
#     p board[[3,4]]
#     p board[[1,0]]
#     p board[[2,2]]
#     p board[[3,6]]
# end

if __FILE__==$PROGRAM_NAME
    newboard=Board.new
    newboard.move_piece([6,5],[5,5])
    p newboard
    newboard.move_piece([1,4],[2,4])
    p newboard
end

# p deep_board.rows
# p board[[2,2]].moves
# p board[[1,0]]
# bug for side attacks for side pawn only on right pawns (7,1 and 7,6)
#bug for 1,1 moves

# test pawn capture, knight not able to take a pawn

