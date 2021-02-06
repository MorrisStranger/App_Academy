require_relative "Piece"

class Knight < Piece
include Stepable
    def intialize(color,board,pos)
    super
end
def moves_diff
:knight
end




# end
end