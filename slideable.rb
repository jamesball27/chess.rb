require 'byebug'
module Slideable

  PERPENDICULAR_DELTAS = [[0, -1], [0, 1], [-1, 0], [1, 0]]
  DIAGONAL_DELTAS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]

  def moves
    moves = []
    move_deltas.each do |(dx, dy)|
      moves += grow_unblocked_moves(dx, dy)
    end
    moves
  end

  private

  def perpendicular_deltas
    PERPENDICULAR_DELTAS
  end

  def diagonal_deltas
    DIAGONAL_DELTAS
  end

  def grow_unblocked_moves(dx, dy)
    moves = []
    x, y = pos

    loop do
      new_pos = [x + dx, y + dy]

      if board.in_bounds?(new_pos) && board[new_pos].empty?
        moves << new_pos
        x, y = new_pos
      else
        break
      end
    end

    moves
  end

end
