module Stepable
    def moves
        if self.moves_diff==:knight
            knight_move
        
        else
            king_move
        end
    end
    # def lateral_dir
    #     x,y=self.pos
    #     positions=[]
    #     ((0...x).to_a+(x..7).to_a).each {|horiz|positions << [horiz,y]}
    #     ((0...y).to_a+(y..7).to_a).each {|vert|positions << [vert,x]}
    #     positions
    # end
    def knight_move
    
    end
    def king_move

    end
  
end
#fix diagonal_dir method
#definitely in this file
#@board.rows.select where no pieces
