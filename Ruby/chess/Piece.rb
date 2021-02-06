# require_relative "Bishop"
class Piece
  attr_accessor :pos, :board
  attr_reader :color

  def intialize(color,board,pos)
    @color = color
    @board = board
    @pos = pos
  end
  def to_s
  end
  def empty?
  end
  def valid_moves
    pos
  end
  def pos=(val)
  end

end