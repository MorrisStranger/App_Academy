require_relative "board"
require_relative "human_player"

class Game
    def initialize(mark_one,mark_two,*other_marks,n)
        @player_one=HumanPlayer.new(mark_one)
        @player_two=HumanPlayer.new(mark_two)
        @current_player=@player_one
        @other_marks=other_marks
        @board=Board.new(n)
        @players=[@player_one,@player_two]+@other_marks.map {|markval| HumanPlayer.new(markval)}

        end
    def switch_turn
        @current_player=@players.rotate![0]
        # curr_ind=players.index(@current_player)
        # if curr_ind == players.length-1
        # @current_player = @player_one
        # else   
        #     @current_player = players[curr_ind+1] 
        #     end
       
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