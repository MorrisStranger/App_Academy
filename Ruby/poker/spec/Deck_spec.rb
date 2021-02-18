require "rspec"
require "Deck"

describe Deck do 
    subject(:new_deck) {Deck.new()}
    
    # let(:card) {double("card",to_s:"A♣")}
    let(:card1) { double("card1",to_s:"A♣") }
    describe "#initialize" do
        it "should set deck to array of cards in deck" do
            
            # new_deck.deck.map(&:to_s)
            expect(new_deck.deck.map{|ele| ele.to_s}).to include(card1.to_s)#redo this as using Card#to_s in first case - cant otherwise
        end
    end
    describe "#deal_card" do
        it "should remove the card from the deck" do
            
            new_deck.deal_card(card1)
            expect(new_deck.cards).to_not include(card1)
        end
    end
end