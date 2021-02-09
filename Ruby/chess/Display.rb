require "colorize"
require_relative "cursor"
require_relative "Board"
class Display
    attr_reader :board
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end
    def render
        @board.rows.each.with_index do |row,i|
            row.each.with_index do |square,j|
               if @cursor.cursor_pos == [i,j]
                    print square.to_s.colorize(:red) + " "
               else
                print square.to_s.colorize(square.color) + " "
               end
    #             # (@cursor.cursor_pos == [i,j]) ? print square.to_s.colorize(:red) : print square.to_s.colorize(square.color) + " "
                
            end
            puts
        end
    end
    def looper
        while true
            render
            @cursor.get_input
        end
    end
end
# board=Board.new
# display = Display.new(board)
# display.looper

if __FILE__==$PROGRAM_NAME
    newboard=Board.new
    display=Display.new(newboard)
    newboard.move_piece([6,5],[5,5])

    display.render
    newboard.move_piece([1,4],[2,4])

    # p newboard[[6,1]].moves # problem with pawn method
    display.render
    newboard.move_piece([6,6],[4,6])
    display.render
    p display.board.checkmate?(:white)
    # p newboard[[1,1]].moves# something wrong with slideable class atleast for bishop and queen
    newboard.move_piece([0,3],[4,7])
    # p newboard[[0,3]].moves
    display.render
    p display.board.checkmate?(:white)
    # newboard.move_piece([1,0],[3,0])
    # display.render
    # p newboard[[0,0]].moves

    # newboard.move_piece([1,4],[2,4])
    # display.render

end