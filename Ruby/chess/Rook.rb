require_relative "Piece"

class Rook < Piece
    attr_accessor :pos, :board
include Slideable
    def intialize(color,board,pos)
    super
end
def moves_dir
:lateral
end



# end
end