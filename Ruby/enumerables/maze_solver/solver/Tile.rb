class Tile
    attr_accessor :value,

    def initialize(value,board)
        @value = value
        @neighbors = neighbors()
        @board = board

    end
    def inspect
        {value:@value}.inspect
    end
    # def to_s
    #     return " " if @value == :_
    #     @value.to_s 
    # end
end