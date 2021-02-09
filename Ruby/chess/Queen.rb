require_relative "Piece"
require_relative "Slideable"
# require_relative "Board"
class Queen < Piece
include Slideable
    def initialize(color,board,pos)
    super
end
def symbol
    :Q
    end
    def moves_dir
        :both
    end


# end
end

# newboard=Board.new
# newqueen=Queen.new(:black,newboard,[0,0])
# p newqueen