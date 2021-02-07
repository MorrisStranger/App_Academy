# require_relative "Bishop"
class Piece
  attr_accessor :pos, :board
  attr_reader :color
  def inspect
  { 'pos' => @pos, 'color' => @color,"symbol"=>self.Symbol }.inspect
  end
  def initialize(color,board,pos)
    @color = color
    @board = board
    @pos = pos
  end
  def to_s
    self.Symbol.to_s
  end
  def empty?
    self.is_a? NullPiece
  end
  def valid_moves
    # moves=[]
    # (0..7).each do |i|
    #   (0..7).each do |j|
    #    moves << [i,j]
    #   end
    # end
    # moves
    (0..7).to_a
  end
  def pos=(val)
    @pos=val
  end
  def Symbol
  symbol
  end

end