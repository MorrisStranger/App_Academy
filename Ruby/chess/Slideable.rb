#could implement diag or lat     as a procedure
require "byebug"
module Slideable
    DIAGONAL_DIRS=[
            [1,1],
            [-1,-1],
            [1,-1],
            [-1,1]
        ]
    LATERAL_DIRS=[
        [0,1],
        [1,0],
        [0,-1],
        [-1,0]
    ]
    def moves
        if self.moves_dir==:lateral
            lateral_dir
        
        elsif self.moves_dir ==:diagonal
            diagonal_dir
        elsif self.moves_dir==:both
            lateral_dir + diagonal_dir
        end
    end
'''
    #moves=[]
    # curr_pos=pos
    for each of indices:
        i=1
        while board[pos+i*indices]!=self.color && pos+i*indices in validation_moves
        
                                                        #if board[pos+indices]!=self.color
    moves << pos+i*indices (each of indices) 
        i+=1

    otherwise 

   '''
    def diag_or_lat(dirs)
        # debugger
            # x,y=self.pos
            moves=[]
            x, y=self.pos
            dirs.each do |(i,j)|
                increment=1
                x_coord, y_coord= x+increment*i, y+increment*j
#change to opposite color
                
                while validations_moves.include?(x_coord) && validations_moves.include?(y_coord) && self.board[[x_coord,y_coord]].color!=self.color
                    moves << [x_coord,y_coord]
                    increment+=1
                    x_coord, y_coord= x+increment*i, y+increment*j

                end
            end
            moves
        end
            #     square=1
            #     while self.validations_moves.include?(x_coord) || self.validations_moves.include?(y_coord)
            #         x_coord+=i
            #         y_coord+=j
            #         break if !self.validations_moves.include?(x_coord) || !self.validations_moves.include?(y_coord)

            #         # p self.board[[4,5]].nil?
            #         pos=[x_coord,y_coord]
            #      if !self.board[pos].empty? 
            #             positions << pos if self.board[pos].color !=self.color
            #     break
            #     end
            #         positions << pos
                
            #     square+=1
            #     i*=square
            #     j*=square
                
            #     end
            # end
            # positions
    # end
    def diagonal_dir
        diag_or_lat(DIAGONAL_DIRS)
    end
    def lateral_dir
        diag_or_lat(LATERAL_DIRS)
    end
end
#fix diagonal_dir method
#definitely in this file
#@board.rows.select where no pieces
