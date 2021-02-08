# require_relative "Bishop"
class Piece
  attr_accessor :pos, :board # need at least a reader for color
  attr_reader :color  #need at least a reader for board
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
  def validations_moves
    # moves=[]
    # (0..7).each do |i|
    #   (0..7).each do |j|
    #    moves << [i,j]
    #   end
    # end
    # moves
    (0..7).to_a
  end
  # def opposite_color(color)
  # color==:black ? :white : :black
  # end
  def valid_moves
    #piece should have a method that says whether it has any valid_moves or not
    self.moves.reject do |move|
      dup_board=board.board_copy
      dup_board.move_piece(self.pos,move)
      dup_board.in_check?(self.color)
    end
  end
      # board.pieces.each do |piece|
      #   pos_moves=piece.moves
      #   pos_moves.each do |move|
      #     dup_board=board.board_copy
      #     dup_board.move_piece(piece.pos,)

      #   end
        
      # end
  
  def pos=(val)
    @pos=val
  end
  def Symbol
  symbol
  end

end