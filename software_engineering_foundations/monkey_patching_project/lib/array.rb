# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array
    def span
        if self == []
            return nil
        end
        self.max-self.min    
    end
    def average
        if self ==[]
            return nil
        end
        sum =0
        self.each {|ele| sum+=ele}
        sum/self.length.to_f
    end
    def median
        length=self.length
        if self ==[]
            return nil
        elsif length % 2 ==0
        return (self.sort[length/2]+self.sort[length/2-1])/2.0
    end
    return self.sort[length/2]
end
def counts
    counts = Hash.new(0)
    self.each {|ele| counts[ele]+=1}
    counts
end
def my_count(element)
counts[element]
end
def my_index(element)
(0...self.length).each {|ele|  return ele if self[ele]===element}
nil
end
def my_uniq
alreadyseen=[]
self.each {|ele| alreadyseen << ele if !alreadyseen.include?(ele)}
alreadyseen
end

def my_transpose
    newarr=[]
    singlearr=[]
     #[[1,2,3] # 0,1=>1,0
      #[4,5,6]
      #[7,8,9]]
    #   debugger
      self.each.with_index do |sub,i| 
        sub.each.with_index do |ele,j| 
       singlearr << self[j][i]
        end
        newarr << singlearr
        singlearr=[]
    end
p newarr
   newarr   
end
end