require_relative "Board.rb"
require "yaml"

'''put raise conditions for invalid input
make render look better
find way of passing pos to Tile class
rest of project
'''
class Game
    def initialize(board)
        @board=board
    end
    def render
        newrow=[]
        minefield=[]
        # debugger
        @board.grid.each do |row|
        row.each do |tile|
            # p tile
        if tile.flagged
            value =  "F"

            newrow << value
        
    elsif tile.revealed && tile.neighbor_bomb_count ==0
                value= "_"
                    newrow << value
               
                
                elsif tile.revealed && !(tile.neighbor_bomb_count ==0)
                    value = tile.neighbor_bomb_count.to_s
                    newrow << value
            
            
            else 
                value = "*"
                newrow << value 
            end
           print value + " "
        end
        puts
        minefield << newrow
        newrow=[]

    end
    minefield
#    p minefield
    end
    # minefield
    # end

    def won?
        @board.grid.flatten.none? {|tile| !(tile.revealed && tile.bomb)}
    end
    def lost?
        @board.grid.flatten.any? {|tile| tile.revealed && tile.bomb}
        
    end
    def game_over?
    won? || lost?
    end
    def save
        p "enter a name of a file you wish to save to ending in .yml"
        input = gets.chomp
        File.open(input,"w") do |file|
        file.write self.to_yaml

        end

   
    end
def self.newgame
newboard=Board.new()
newboard.create_board
newgame=Game.new(newboard)
newgame.run
end

    def self.load()

        name = ARGV.shift
        if name.nil?
            self.newgame
    
    else
        saved_board=YAML.load_file(name)
        saved_game = Game.new(saved_board)
        saved_game.run
    end
end
    def run
         
        until game_over?
        render
        move

        end
        if won?
            p "you won"
        elsif lost?
            p "you clicked a bomb"
        end
    end
    
    
    def prompt
        p "type r then a coordinate to reveal"
        p "type f then a coordinate to flag"
        p "type s to save game"
        input=gets.chomp()
        if input[0]=="s"
            save
        end
        arr=input.split("")

        action=arr[0]
        pos=arr[1..-1].map(&:to_i)
        return action,pos
    end
    def move
        action,pos=prompt
        if action =="r"
            # @board[pos].reveal
            recursive_reveal(pos)
            
            # @board[pos].reveal

        elsif action =="f"
            # p @board[pos].flagged
            @board[pos].flag
            
        # elsif action=="save"


        end
    end
    def recursive_reveal(pos)
 
        @board[pos].reveal
        if @board[pos].neighbor_bomb_count==0
            
            @board[pos].neighbors.each do |neighbor|
           
                if !neighbor.revealed
                recursive_reveal(neighbor.tile_indices)
                end
            end
        end 
    
    end
        
    end    


Game.load