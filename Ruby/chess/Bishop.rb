require_relative "Piece.rb"

class Bishop < Piece
include Slideable
    def intialize(color,board,pos)
    super
end
def moves_dir
:diagonal
end



# end
end

