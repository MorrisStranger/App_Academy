require "rspec"
require "lru"

describe LRUCache do
    subject(:cache) {LRUCache.new(4)}
    describe  "#initialize" do
        it "should set a cache_size" do
            # expect(cache.cache_size).to be_an_instance_of(Integer)
            expect(cache.cache_size).to eq(4)
    
        end
        it "initializes a cache to an empty array" do
            expect(cache.show).to be_an_instance_of(Array)
            expect(cache.show).to be_empty
        end
    end 
    describe "#add" do
        context "if the cache is not full" do 
            it "should add the element to the end of the cache" do
                cache.add(5)
                expect(cache.show).to eq([5])
                cache.add("hello")
                expect(cache.show).to eq([5,"hello"])
            end

        end
        context "if the cache is full" do
            before(:each) do
                (1..4).each {|el| cache.add(el)}
                cache.add(10)


            end
            it "should not increase the size of the cache" do
                expect(cache.show.size).to eq(4)
            end
            it "should eject the LRU element in the cache" do
                expect(cache.show).to_not include(1)
            end
            it "should add the element to the end of the cache" do
                expect(cache.show.last).to eq(10)
            end
            
        end
            context "if the element is in the cache" do
                before(:each) do
                    cache.add(20)
                    cache.add(10)
                    cache.add(20)
                end
                it "should move the element to the end of the cache" do
                    expect(cache.show).to eq([10,20])
                end
                it "should not increase the size of the cache" do
                    expect(cache.show.size).to eq(2)
                end

            
            end
            it "should return the correct ordering of elements in the cache" do
                cache.add("I walk the line")
                cache.add(5)
                cache.add([1,2,3])
                cache.add(5)
                cache.add(-5)
                cache.add(a: 1, b: 2, c: 3)
                cache.add([1,2,3,4])
                cache.add("I walk the line")
                cache.add(:ring_of_fire)
                cache.add("I walk the line")
                cache.add(a: 1, b: 2, c: 3)
                expect(cache.show).to eq([[1, 2, 3, 4], :ring_of_fire, "I walk the line", a:1, b:2, c:3])



            end
    end
    describe "#count" do
    it "should return the number of elements in the cache" do
        (1..4).each do |el| 
        cache.add(el)
        expect(cache.count).to eq(el)
        end

    end
end
end