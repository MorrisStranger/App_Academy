require "first_tdd"
require "rspec"

describe Array do
    describe "#my_uniq" do
        it "has to contain only unique elements of array" do
            original=[1,2,1,3,3]
            expect(original.my_uniq).to eq([1,2,3])
        end

    end
    describe "#two_sum" do
        it "has to contain the positions of pairs of elements that add to 0" do
            expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])
        end

    end
    describe "#my_transpose" do
    it "returns an array of columns (flips matrix)" do
        rows=[[0,1,2],[3,4,5],[6,7,8]]
        expect(rows.my_transpose).to eq([[0,3,6],[1,4,7],[2,5,8]])

    end
end
    describe "#stock_picker" do 
        it "returns the biggest spread" do 
            prices = [10,40,5,20,100]
            expect(prices.stock_picker).to eq([1,2])
        end
    end
end