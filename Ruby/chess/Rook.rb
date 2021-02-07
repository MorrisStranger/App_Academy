require_relative "Piece"
require_relative "Slideable"
# require_relative "Board"
class Rook < Piece
include Slideable
# def initialize()
    # super
# end
    # def intialize(color,board,pos)
    # super(color,board,pos)
# end
def moves_dir
:lateral
end
def symbol
:R
end



# end
end
# newboard=Board.new
# newrook=Rook.new(:black,newboard,[0,0])
# p newrook.moves