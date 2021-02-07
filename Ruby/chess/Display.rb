require "colorize"
require_relative "cursor"
require_relative "Board"
class Display
    
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end
    def render
        p @board.rows
        @board.rows.each.with_index do |row,i|
            row.each.with_index do |square,j|
                if @cursor_pos == [i,j]
                    print square.to_s.colorize(:blue)
                end
                print square.to_s.colorize(square.color) + " "
            end
            puts ""
        end
    end
end
board=Board.new
display = Display.new(board)
display.render