require_relative "Piece"
require_relative "Stepable"
# require_relative "Board"
class Knight < Piece
include Stepable
    def initialize(color,board,pos)
    super
end
def moves_diff
:knight
end
def symbol
    :N
    end



# end
end
# newboard=Board.new
# newknight=Knight.new(:black,newboard,[0,0])
# p newknight.moves
