require_relative 'tic_tac_toe'
require "byebug"
class TicTacToeNode
  attr_reader :board, :next_mover_mark,:prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
  @board=board
  @next_mover_mark=next_mover_mark
  @prev_move_pos=prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end
 

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    node_arr=[]
    # debugger
    # dup_board=@board.dup
    @board.rows.each.with_index do |row,i|
      row.each.with_index do |ele,j|

        # if @board.empty?([i,j]) 
        if @board.empty?([i,j]) 
          dup_board=@board.dup
          # marker=
          dup_board[[i,j]]=@next_mover_mark # this is why
          new_mover_mark=@next_mover_mark ==:x ? :o : :x

          new_prev_move_pos=[i,j]
          # node=self.class.new(dup_board,new_mover_mark,new_prev_move_pos)

          node_arr << self.class.new(dup_board,new_mover_mark,new_prev_move_pos)
      end
    end
    #Board.new(rows)

  end
  # p node_arr
node_arr
end
def losing_node?(evaluator)
  # debugger
  if @board.over? &&  @board.winner == (evaluator==:x ? :o : :x)
    return true
  elsif @board.over?
    return false
  end
  if @next_mover_mark == evaluator && self.children.all? do |child| 
    child.losing_node?(evaluator)
  end   
    return true
  elsif @next_mover_mark != evaluator &&  self.children.any? {|child| child.losing_node?(evaluator)}
  return true
else
  return false


  end
  
end
def winning_node?(evaluator)
  if @board.over? && @board.winner == evaluator
    return true
  elsif @board.over? && (!@board.winner || @board.winner == (evaluator==:x ? :o : :x))
    return false
  end
  if @next_mover_mark ==evaluator && self.children.any? {|child| child.winning_node?(evaluator)}
  return true
  elsif @next_mover_mark != evaluator && self.children.all? {|child| child.winning_node?(evaluator)}
  return true  
end
false
end
end
#             expect(winner.winning_node?(:o)).to eq(false)


# x x o
# x o _
# _ _ _