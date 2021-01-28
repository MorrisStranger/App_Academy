class Board
        def initialize
            @grid = Array.new(3) {Array.new(3,"_")}
        end
        def valid?(pos)
            pos.all? {|ele| ele.between?(0,2)}
        end
        def empty?(pos)
            @grid[pos]=="_"
        end
        def place_mark(pos,mark)
            if !(valid?(pos) || empty?(pos))
                raise "cannot place there"
        end
end