require_relative "Piece"
require "byebug"
class Pawn < Piece
    def symbol
    :p
    end

    def at_start_row?
        if self.color==:black
            return self.pos[1]==1
            
        
        else
            return self.pos[1]==6
        end
    end
    def forward_steps
        if at_start_row?
        return 2
        else
            return 1
        end
    end
    def forward_dir
        if self.color ==:black
            return 1
        else
            return -1
        end
    end
    def side_attacks
        x,y=self.pos
        #if white => +1,-1 and -1,-1
        #if black => +1,+1 and -1,+1
        pieces_attacked=[]
        first_pos = [x+forward_dir,y+forward_dir]
        second_pos = [x-forward_dir,y+forward_dir]
        
        if first_pos.all? {|coord| valid_moves.include?(coord)} && !self.board[first_pos].empty?
        pieces_attacked << first_pos
        end

        if second_pos.all? {|coord| valid_moves.include?(coord)} && !self.board[second_pos].empty?
            pieces_attacked << second_pos
        end
        pieces_attacked
        
    end
    def moves
        x,y=pos
        moves=[]
        # debugger
        (1..forward_steps).each {|step| moves << [x,y+self.forward_dir*step]}
        moves+=side_attacks
        moves.select { |(i,j)| i.between?(0,7) && j.between?(0,7) }
    end
end