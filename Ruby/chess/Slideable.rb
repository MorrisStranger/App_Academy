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
    # def lateral_dir
    #     x,y=self.pos
    #     positions=[]
    #     ((0...x).to_a+(x..7).to_a).each {|horiz|positions << [horiz,y]}
    #     ((0...y).to_a+(y..7).to_a).each {|vert|positions << [vert,x]}
    #     positions
    # end
    def diag_or_lat(const_arr)
            x,y=self.pos
            positions=[]
            const_arr.each do |(i,j)|
                square=1
                x_coord, y_coord==self.pos
                while x_coord.between(0,7) || y_coord.between(0,7)
                    x_coord+=i
                    y_coord+=j
                 if !self.board.rows[[x_coord,y_coord]].nil? 
                    if 
                        self.board.rows[[x_coord,y_coord]].color !=self.color
                        positions << [x_coord,y_coord]

                    end
                break
                end
                    positions << [x_coord,y_coord]
                
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
