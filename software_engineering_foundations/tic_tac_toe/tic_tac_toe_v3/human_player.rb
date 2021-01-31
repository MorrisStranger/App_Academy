class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark=mark_value

    end
   def get_position(legal_positions)
    begin
    p "enter a position e.g: 1 2 with " + self.mark.to_s
    input=gets.chomp
    pos=input.split(" ").map(&:to_i)
        raise "you entered the wrong format"
    rescue
        p "#{pos} is not a legal position"
        retry if input.length !=3 || !legal_positions.include?(pos)
    end
    pos
   end
    
end