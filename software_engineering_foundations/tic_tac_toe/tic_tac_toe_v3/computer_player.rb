class ComputerPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark=mark_value

    end
    def get_position(legal_positions)
        pos=legal_positions.sample
        p "computer chose #{pos.to_s} with #{@mark}"
        pos
    end
end