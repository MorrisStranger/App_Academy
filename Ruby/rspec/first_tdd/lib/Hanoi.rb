class Hanoi
    attr_reader :stacks
    def initialize(stacks)
        @stacks = stacks
        @stack_pos=starting_stack
    end
    def move(pos)
        x,y=pos
        
        if (self.stacks[y].empty? || !self.stacks[x].empty? && self.stacks[x].last < self.stacks[y].last)
            value=self.stacks[x].pop
            self.stacks[y] << value
        end
      
        
    end
    def won?
        @stacks[@stack_pos].empty? && 
        # && (0...@stacks.length).any? {|stack_n| @stacks[stack_n].sort == [] }
        # @stacks[]
        end
    private
    def starting_stack
    (0...@stacks.length).each {|pos| return pos unless @stacks[pos].empty?}
    end
    
end