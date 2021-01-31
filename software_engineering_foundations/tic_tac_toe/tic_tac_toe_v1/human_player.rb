class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark=mark_value

    end
   def get_position()
    begin
    line="enter a position e.g: 1 2 with " + self.mark.to_s
    p line
    input=gets.chomp
    pos=input.split(" ").map(&:to_i)
        raise "you entered the wrong format"
    rescue
        retry if input.length !=3
    end
    pos
   end
    
end