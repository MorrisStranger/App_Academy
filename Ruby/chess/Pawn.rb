require_relative "Piece"
require "byebug"
class Pawn < Piece
    def symbol
    :p
    end

    def at_start_row?
        if self.color==:black
            return self.pos[0]==1
            
        
        else
            return self.pos[0]==6
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
        #if white => left=-1,-1 and right=-1,+1
        #if black => left=+1,-1 and right=+1,+1
        pieces_attacked=[]
        left = [x+forward_dir,y-1]
        right = [x+forward_dir,y+1]
        
        if left.all? {|coord| validations_moves.include?(coord)} && !self.board[left].empty? && self.board[left].color!=self.color
        pieces_attacked << left
        end

        if right.all? {|coord| validations_moves.include?(coord)} && !self.board[right].empty? && self.board[right].color!=self.color
            pieces_attacked << right
        end
        pieces_attacked
        
    end
    def moves
        x,y=pos
        moves=[]
        # debugger
        #moves

        (1..forward_steps).each {|step| moves << [x+self.forward_dir*step,y]}
        moves=moves.select { |(i,j)| i.between?(0,7) && j.between?(0,7) && self.board[[i,j]].empty? }
        moves+=side_attacks
        
    end
end