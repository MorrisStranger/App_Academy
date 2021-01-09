class Card
    attr_reader :val
    attr_reader :hidden
def initialize(val)
    @hidden = true
    @val=val
end

def hide
    @hidden = true
    @val = ""
end
def reveal
    @hidden=false
    @val = val
    p @val
end
# def to_s
# end
# def ==
# end
end