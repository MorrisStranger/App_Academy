# require "colorize"
# ♠♥♦♣
class Card

  
    attr_reader :number, :suit
    def self.suits
        {
        spades: "♠",
        clubs:"♣",
        hearts:"♥",
        diamonds:"♦"
        
    }
    end
    def initialize(number,suit)
        @number, @suit = number , suit
    end
    def to_s
        # begin
        # p number.to_s
        # p self.class.suits
        
        # rescue
            number.to_s+self.class.suits[self.suit]
        # end
    # number.to_s+self.class.suits[self.suit]
    end

end
