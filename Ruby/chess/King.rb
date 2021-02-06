require_relative "Piece"

class King < Piece
include Stepable
    def intialize(color,board,pos)
    super
end
def moves_diff
    :king
    end



# end
end