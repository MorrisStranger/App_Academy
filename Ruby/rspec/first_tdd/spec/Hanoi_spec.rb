require "rspec"
require "Hanoi"

describe Hanoi do
    let(:stacks) {[[5,4,3,2,1],[],[]]}
    subject(:game) {Hanoi.new(stacks)}
    describe "#initialize" do
        it "should set a stacks variable to a 3d array with one stack with numbers in descending order and the others empty" do
            expect(game.stacks).to eq(stacks)

        end
    end
    describe "#move" do
    let (:pos) {[0,1]}
            it "should not change the stacks if the first stack is empty" do
                game.move([1,0])
                expect(game.stacks).to eq(stacks)
            end

        before do
            game.move(pos) 
        end
      
            it "if the disk on the second stack has a lower value\
            at the top than the value at the top of the first stack then it should not move the disks" do 
                game.move(pos)
                expect(game.stacks).to eq([[5,4,3,2],[1],[]])
                
            end

    
        it "should move a disk from the first stack to the second" do 
            

            expect(game.stacks[pos[0]].length).to eq(4)
            expect(game.stacks[pos[1]].length).to eq(1)
        end
        it "should only take a disk from the end of the first stack" do
        expect(game.stacks[pos[0]].last).to eq(2)
        
        end
        it "should only add a disk to the end of the second stack" do
            expect(game.stacks[pos[1]].last).to eq(1)
        end


       
    end
    describe "#won" do 
    
        it "should not be a win if there are any disks in the column that we started on" do
            # not_win = Hanoi.new([[5,4,3,2,1],[],[]])
            expect(game.stacks)
            expect(not_win.won?).to eq(false)
        end
        it "should contain all the disks in one column" do
            not_win = Hanoi.new([[5,4,3,2],[],[]])
            expect(not_win.won?).to eq(false)
        end
        it "should contain the disks stacked in order in a column"
        it "should not contain disks in any other columns"

end
end