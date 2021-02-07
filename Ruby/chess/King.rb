require_relative "Piece"

class King < Piece
include Stepable
    def initialize(color,board,pos)
    super
end
def moves_diff
    :king
    end
    def symbol
        :K
        end



# end
end