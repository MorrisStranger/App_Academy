require_relative "board"
require_relative "human_player"

class Game
    def initialize(mark_one,mark_two)
        @player_one=HumanPlayer.new(mark_one)
        @player_two=HumanPlayer.new(mark_two)
        @current_player=@player_one
        @board=Board.new
        end
    def switch_turn
        if @current_player==@player_one
            @current_player = @player_two
        else
            @current_player=@player_one
        end
    end
    def play
        while @board.empty_positions?
        @board.print
        pos=@current_player.get_position
        redo if !@board.place_mark(pos,@current_player.mark)
        
        if @board.win?(@current_player.mark)
        @board.print

        p "victory for "+@current_player.mark.to_s
        return
        else
            self.switch_turn
        end
    end
    @board.print
    p "game is drawn"
    end
end