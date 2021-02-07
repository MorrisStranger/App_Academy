require_relative "Piece.rb"
require "singleton"
class NullPiece < Piece
    include Singleton
    # def initialize(color,board,pos)
    # super
    def initialize
        @color=:neutral
        @symbol=:_
        
    
    # @color
    end
    def symbol
    @symbol
    end
    def color
        @color
    end
    def moves
    []
    end
end

