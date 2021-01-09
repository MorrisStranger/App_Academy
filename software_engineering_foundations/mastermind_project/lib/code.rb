class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
def self.valid_pegs?(char_arr)
char_arr.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
end
def initialize(char_arr)
  if !Code.valid_pegs?(char_arr)
  raise "error"
  else
    @pegs = char_arr.map {|char|char.upcase}  
end

end
def pegs
@pegs
end
def self.random(length)
  Code.new(Array.new(length) {POSSIBLE_PEGS.keys.sample})
end
def self.from_string(pegs)
  Code.new(pegs.split(""))
end
def [] index
pegs[index]
end
def length
  @pegs.length
end
def num_exact_matches(code)
sum =0
  code.pegs.each.with_index do |peg,idx| 
    if peg==self[idx]
    sum+=1
    end
  end
  sum
end
def num_near_matches(code)
  sum=0
  code.pegs.each.with_index {|peg,idx| sum+=1 if peg != self[idx] && self.pegs.include?(peg)}
sum

#if include in hash, add 1 and if not match
end
def ==(othercode)
self.pegs== othercode.pegs
end
end
