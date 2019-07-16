




require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark #mark of the who will move next?
    @prev_move_pos = prev_move_pos #position of the previous mark?
  end

  def losing_node?(evaluator) #evaluator is a particular mark
    return true if @board.over? && @board.winner != @next_mover_mark
    return false if @board.over? && @board.winner == @next_mover_mark || nil

    #pseudo code:
    players turn && evaluator.children.all? {|child| losing_node?(child)}
    opponents turn && evaluator.children.any? {|child| winning_node?(child)}

  end

  def winning_node?(evaluator) #mark
    return true if @board.over? && @board.winner != @next_mover_mark
    return false if @board.over? && @board.winner == @next_mover_mark || nil

    #pseudo code:
    players turn && evaluator.children.any? {|child| winning_node?(child)}
    opponents turn && evaluator.children.all? {|child| losing_node?(child)}

  end

  # This method generates an array of all moves that can be made after the current move.
  def children
    array = []
    @board.each do |pos|
      if @board.empty?(pos)
        array << TicTacToeNode.new(@board.dup, @next_mover_mark, pos)
      end
    end
    array
  end

end
