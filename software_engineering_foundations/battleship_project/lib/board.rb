require "byebug"
class Board
    attr_reader :size
    def initialize n
        @n = n
        @size = n*n
        @grid = Array.new(n) {Array.new(n,:N)}
    end 
    def [](arr)
        @grid[arr[0]][arr[1]]   
    end
    def []=(position,value)
        @grid[position[0]][position[1]] = value
    end 
    def num_ships
        nships=0
            @grid.flatten.each{|ele|nships+=1 if (ele == :S)}
                
                
        
        nships

    end
    def attack position
        if self[position]==:S
        self[position]= :H
        p "you sunk my battleship!"
        return true
        
        else
        self[position]=:X
        return false
    
    end
    end
    def place_random_ships
        num_ships = 0
        row_arr = [*0...@n]
        while num_ships < @size*0.25
            # debugger
             a = row_arr.sample
            b = row_arr.sample
            d = [a,b]
            if self[d]!=:S
                self[d]=:S
                
                num_ships+=1

            end
            end

    end
    def hidden_ships_grid
    @grid.map do |arr|
         (0...@n).map do |ele|
             if arr[ele]==:S
                :N
             elsif arr[ele]==:N
                :N
             else
                :X
            end
            end
    end
end
def self.print_grid(arr)
    arr.each do |minarr|
        # debugger
     
puts minarr.join(" ")
    end
end
def cheat
    Board.print_grid(@grid)
end
def print
    Board.print_grid self.hidden_ships_grid 
end
end
