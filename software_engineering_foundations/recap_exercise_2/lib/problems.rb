# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
require "byebug"
def least_common_multiple(num_1, num_2)
(num_1..num_1*num_2).each{ |ele| return ele if (ele % num_1 ==0 && ele % num_2 ==0)}
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
strarr=str.split("")
bigrams=(0...strarr.length-1).map{|idx| strarr[idx]=strarr[idx]+strarr[idx+1] }
hashcount = Hash.new(0)
bigrams.each {|bigram| hashcount[bigram]+=1}
hashcount.key(hashcount.values.max)
end
# most_frequent_bigram("gotothemoonsoonforproof")

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inversed = Hash.new
        self.each {|k,v| inversed[v]=k}
inversed
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        counter = 0
        # debugger
        (0...self.length-1).each do |first|
        (first+1...self.length).each do |second|
        if self[first]+self[second] == num
            counter+=1
        end
        end
        end
        counter
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        sorted = false
        prc ||= Proc.new {|a,b|a<=>b}

        # debugger
        while sorted == false
            sorted = true
            (0...self.length-1).each do |ele|
            if prc.call(self[ele],self[ele+1]) ==1
                                self[ele],self[ele+1] = self[ele+1],self[ele]
                                sorted =false
               
            end
        end
        end
        
        self

    end
end

#bubble_sort {|a,b| a<=>b}