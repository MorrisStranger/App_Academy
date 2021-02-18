require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do

  let(:chef) { double("chef") }
  subject(:dessert) {Dessert.new("brownie",100,chef)}

  describe "#initialize" do

  it "sets a type" do
      expect(dessert.type).to eq("brownie")
     end

    it "sets a quantity" do 
    expect(dessert.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
    expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
    expect {Dessert.new(100,"non-int",chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
    expect(dessert.add_ingredient("flour")).to eq(["flour"]) 
    end
  end

  describe "#mix!" do
    it "shuffles the ingredients array" do

    ["sugar","flour","marzepan"].each {|ingredient| dessert.add_ingredient(ingredient)}
    before = dessert.ingredients.dup
    dessert.mix!
    after =dessert.ingredients
    expect(before.all?{|ingredient| after.include?(ingredient)})
    expect(before).to_not eq(after)
    
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
    amount = 10
    dessert.eat(amount)
    expect(dessert.quantity).to eq(90)
    end
    it "raises an error if the amount is greater than the quantity" do
    amount = 1000

    expect {dessert.eat(1000)}.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      # allow(chef).to receive(:name and return "mike hanson the greatest")
      allow(chef).to receive(:name).and_return("Tucker")
      allow(chef).to receive(:titleize).and_return("Chef #{chef.name} the Great Baker")
      # allow(chef).to receive(:titleize).and_return("mike hanson the greatest")

      expect(dessert.serve).to eq("Chef Tucker the Great Baker has made #{dessert.quantity} #{dessert.type.pluralize}!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
    # expect(subject.make_more())
      expect(chef).to receive(:bake).with(instance_of(Dessert)) 
      dessert.make_more
    end
  end
end
