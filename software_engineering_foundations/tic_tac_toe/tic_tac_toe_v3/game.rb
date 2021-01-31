require_relative "board"
require_relative "human_player"

class Game
    attr_reader :players
    def initialize(n,mark_hash)
        # @player_one=computer_or_not(mark_hash[0])
        # @player_two=computer_or_not(mark_hash[1])
        # @current_player=@player_one
        # @other_marks=mark_hash
        @board=Board.new(n)
        @players=[]
        mark_hash.each {|mark| @players << computer_or_not(mark)}
        @current_player = @players[0]
        end
        def computer_or_not(marker)
            # p marker
            if marker[1]==true
                return ComputerPlayer.new(marker[0])
            else
                return HumanPlayer.new(marker[0])
            end
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
        
        pos=@current_player.get_position(@board.legal_positions)
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