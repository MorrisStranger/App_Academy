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
        else
            lateral_dir + diagonal_dir
        end
    end
   
    def diag_or_lat(dirs)
            # x,y=self.pos
            positions=[]
            dirs.each do |(i,j)|
                square=1
                x_coord, y_coord=self.pos
                while self.valid_moves.include?(x_coord) || self.valid_moves.include?(y_coord)
                    x_coord+=i
                    y_coord+=j
                    break if !self.valid_moves.include?(x_coord) || !self.valid_moves.include?(y_coord)

                    # p self.board[[4,5]].nil?
                    pos=[x_coord,y_coord]
                 if !self.board[pos].empty? 
                        positions << pos if self.board[pos].color !=self.color
                break
                end
                    positions << pos
                
                square+=1
                i*=square
                j*=square
                
                end
            end
            positions
    end
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
