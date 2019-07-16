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
    return true if @board.over? && @board.winner != @next_mover_mark
    return false if @board.over? && @board.winner == @next_mover_mark || nil

    # if players turn
    #   return evaluator.children.all? {|child| losing_node?(child)}
    # end
    # if opponents turn 
    #   return evaluator.children.any? {|child| winning_node?(child)}
    # end

  end

  def winning_node?(evaluator) #mark
    return true if @board.over? && @board.winner != @next_mover_mark
    return false if @board.over? && @board.winner == @next_mover_mark || nil

    # #pseudo code:
    # players turn && evaluator.children.any? {|child| winning_node?(child)}
    # opponents turn && evaluator.children.all? {|child| losing_node?(child)}

  end

  # This method generates an array of all moves that can be made after the current move.
  def children
    array = []
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |pos, i2|

        if pos == nil && @next_mover_mark == :o
          array << TicTacToeNode.new(@board.dup, :x, [i,i2])
        elsif pos == nil && @next_mover_mark == :x
          array << TicTacToeNode.new(@board.dup, :o, [i,i2])
        end
      end
    end
    array
  end

end
