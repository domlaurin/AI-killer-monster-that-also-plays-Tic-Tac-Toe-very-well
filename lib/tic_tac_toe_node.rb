require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    winning_player = self.players[self.board.winner]
    return true if @board.over? && winning_player != #us
    return false if @board.over? && winning_player == #us || nil

    
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    @board.each do |pos|
      if @board.empty?(pos)
        TicTacToeNode.new(@board.dup, pos, pos) #what should I do with this node?
      end
    end
  end

end
