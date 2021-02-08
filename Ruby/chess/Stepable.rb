require "byebug"
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
    def knight_or_king_move(move_arr)
        
            
            x,y=self.pos
            positions=[]
            move_arr.each do |(a,b)|
                x_coord, y_coord= x+a, y+b
                next if !self.validations_moves.include?(x_coord) || !self.validations_moves.include?(y_coord)

                positions << [x_coord,y_coord] unless self.board[[x_coord,y_coord]].color == self.color # error here
            end
        positions
    end
    def knight_move
        knight_moves=[
            [1,2],
            [-1,2],
            [-1,-2],
            [1,-2],
            [2,1],
            [-2,1],
            [-2,-1],
            [2,-1]
         ]
         knight_or_king_move(knight_moves)
    end
        

    def king_move
        
        king_moves=[
            [-1,1],
            [0,1],
            [1,1],
            [-1,0],
            [1,0],
            [-1,-1],
            [0,-1],
            [1,-1]
        ]
       knight_or_king_move(king_moves)
    end
  
end
#fix diagonal_dir method
#definitely in this file
#@board.rows.select where no pieces
