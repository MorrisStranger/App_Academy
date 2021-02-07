require_relative "Piece"
require_relative "Slideable"
# require_relative "Board"


class Bishop < Piece
include Slideable
    def initialize(color,board,pos)
    super
end
def moves_dir
:diagonal
end
def symbol
:B
end



# end
end
# newboard=Board.new
# newbishop=Bishop.new(:black,newboard,[0,0])
# p newbishop

