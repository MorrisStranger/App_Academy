class Board
        def initialize(n)
            @n=n
            @grid = Array.new(@n) {Array.new(@n,"_")}
        end
        def valid?(pos)
            pos.all? {|ele| ele.between?(0,@n-1)}
        end
        def empty?(pos)
            self[pos]=="_"
        end
        def place_mark(pos,mark)
                # puts "place mark"
               if !valid?(pos) || !empty?(pos)
                puts "cannot place there"
                return false    
            end

                self[pos]=mark
                     
                    
                end
                
        # end
        def [](pos)
            x,y=pos
            @grid[x][y]
        end
        def []=(pos,val)
        x,y=pos
        @grid[x][y]=val
        end
        # def grid
        # @grid
        # end
        def print
        @grid.each {|ele|p ele}
        end
        def win_row?(mark)
            @grid.any? do |row|
            row.all? {|ele|ele==mark}
            
        end
    end
        def win_col?(mark)
        @grid.transpose.any? do |col|
            col.all? {|ele|ele==mark}
        end
        end
        def win_diag?(mark)
            left_diag=(0...@grid.length).map { |i| @grid[i][i] }
            right_diag =(0...@grid.length).map { |i| @grid[i][-i-1] }
            left_diag.all?{|ele| ele ==mark} || right_diag.all? {|ele|ele==mark}
        end
        def win?(mark)
            win_diag?(mark) || win_col?(mark) || win_row?(mark)
        end
        def empty_positions?
            @grid.any? do |row|
                row.any? {|ele| ele=="_"}
                

            end

        end
        def legal_positions
            legal_positions=[]
        @grid.each.with_index do |row,i|
    
            row.each.with_index do |ele,j|
                if ele=="_"
                    legal_positions << [i,j]
                end
            end
        end
        legal_positions
        end
    
end
