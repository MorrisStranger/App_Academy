require "rspec"
require "Deck"

describe Deck do 
    subject(:new_deck) {Deck.new()}
    
    # let(:card) {double("card",to_s:"A♣")}
    let(:card1) { double("card1",to_s:"A♣") }
    # let(:player1) {double("player1",hand:)}
    describe "#initialize" do
        it "should set deck to array of cards in deck" do
            
            # new_deck.deck.map(&:to_s)

            expect(new_deck.deck.map{|ele| ele.to_s}).to include(card1.to_s)
            
            #redo this as using Card#to_s in first case - cant otherwise
        end
    end
    describe "#deal_card" do
        it "should remove a card from the deck" do
            original_deck = new_deck.deck.dup
            new_deck.deal_card
            (0...original_deck.length).each do |i| 
                card = original_deck[i]
                p card
                p new_deck.deck.include?(card) 
                $delt_card = card unless new_deck.deck.include?(card) 
                # p $delt_card
                end
                p "hello"
                p $delt_card
            expect(original_deck).to include($delt_card)
            expect(new_deck.deck).to_not include($delt_card)#problem here
            expect(new_deck.deck.length).to eq(51)

            # expect(player1).to_receive()

        end
        # it "should add the card to the players hand" do 
        #     expect(player1
        # end
    end
end

