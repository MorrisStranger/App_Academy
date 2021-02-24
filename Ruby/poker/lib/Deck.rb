require_relative "Card"

class Deck

    # SUITS=[
    #     :spades,
    #     :clubs,
    #     :hearts,
    #     :diamonds
        
    # ]
    CARDS=(2..10).map(&:to_s.to_sym)+[:J,:Q,:K,:A]
    # ♠♥♦♣
    attr_reader :deck
    def initialize
        @deck = deck_maker()
        
    end
    def deal_card()

        deck.delete(deck.sample(1)[0])
        # player1.hand << delt_card
        # delt_card
    end
    private
    def deck_maker
        deck=[]
        Card.suits.keys.each do |suit|
            CARDS.each do |card|
                deck << Card.new(card,suit)
            end
        end
        deck
    end
end