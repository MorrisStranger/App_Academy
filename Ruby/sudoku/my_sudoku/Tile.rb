class Tile
    attr_accessor :value
    attr_accessor :given
def initialize(value,given)
    @value = value
    @given=given
end
def to_s(value)
    if value == 0
        return ""
    else
        return value.to_s
    end
end

end