require_relative("Card.rb")
require "byebug"
class Board
@@letters = "ABCD"
attr_accessor :grid

def initialize(size)
@size=size
@grid = Array.new(@size) {Array.new(@size)}
end
def populate
    already_used=[]
    while @grid.flatten.any? {|ele| ele==nil}
    #  debugger
    
    letter = @@letters.split("").sample
    index1 = (0...@size).to_a.sample
    index2= (0...@size).to_a.sample
    index3 = (0...@size).to_a.sample
    index4= (0...@size).to_a.sample
    if !already_used.include?([index1,index2]) && !already_used.include?([index3,index4]) && ([index1,index2] != [index3,index4])

 
    @grid[index1][index2] ||= Card.new(letter)
    @grid[index3][index4] ||= Card.new(letter)
    already_used << [index1,index2]
    already_used << [index3,index4]
p already_used
    end
    
   
   
    # if !already_used.include?([index3,index4])
    #     p "second indices"
    # p index3
    # p index4
   
  
    # # p @grid
    # end
    p already_used
end
end

def render
arr = []
result=[]
# debugger
@grid.each do |ele| 
    ele.each do |i|
        i.hidden ? arr << "": arr << i.val
        # arr << i.value
        end
        result << arr
        arr=[]

        
end
result.each {|ele| p ele}
end
def won?
@grid.flatten.all? {|ele| !ele.hidden} 
end

def reveal(guessed_pos)
    # @grid[guessed_pos].reveal
    @grid[guessed_pos[0]][guessed_pos[1]].reveal
end
def [](pos)
self.grid[pos[0]][pos[1]]
end
end
# p a