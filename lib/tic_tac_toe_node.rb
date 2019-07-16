require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader  :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos 
  end

  def losing_node?(evaluator)
    return true if @board.over? && @board.winner != evaluator
    return false if @board.over? && @board.winner == evaluator || nil

    if evaluator == @next_mover_mark #it's player's turn
      self.children.each do |child| 
        if child.losing_node?(evaluator) == false
          return false
        end
      end
      return true
    end

    if evaluator != @next_mover_mark #it's opponent's turn
      self.children.each do |child| 
        if child.losing_node?(evaluator) == true
          return true
        end
      end
      return false
    end

    # if evaluator != @next_mover_mark
    #   return self.children.any? {|child| winning_node?(evaluator)}
    # end
  end




  def winning_node?(evaluator)
    return false if @board.over? && @board.winner != evaluator
    return true if @board.over? && @board.winner == evaluator || nil

    if evaluator == @next_mover_mark #it's player's turn
      self.children.each do |child| 
        if child.losing_node?(evaluator) == false
          return true
        end
      end
      return false
    end

    if evaluator != @next_mover_mark #it's opponent's turn
      self.children.each do |child| 
        if child.losing_node?(evaluator) == true
          return false
        end
      end
      return true
    end
  end

  # This method generates an array of all moves that can be made after the current move.
  def children
    array = []
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |pos, i2|

        if pos == nil && @next_mover_mark == :o
          board_dup = @board.dup
          pos = [i,i2]
          board_dup[pos] = :o
          array << TicTacToeNode.new(board_dup, :x, [i,i2])

        elsif pos == nil && @next_mover_mark == :x
          board_dup = @board.dup
          pos = [i, i2]
          board_dup[pos] = :x
          array << TicTacToeNode.new(board_dup, :o, [i,i2])
        end
      end
    end
    array
  end

end
# def []=(pos, mark)
#     raise "mark already placed there!" unless empty?(pos)

#     row, col = pos[0], pos[1]
#     @rows[row][col] = mark
#   end
