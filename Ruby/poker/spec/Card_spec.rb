require "rspec"
require "Card"

describe Card do
    subject(:card) {Card.new(:A,:diamonds)}
    describe "#intialize" do
        it "should set the card number" do
            expect(card.number).to eq(:A)
        end
        it "should set the card suit" do
            expect(card.suit).to eq(:diamonds)
        end

       
    end
    describe "#to_s" do
        it "should turn the card value to a nice format string" do
            expect(card.to_s).to eq("A♦")
        end
    end

end