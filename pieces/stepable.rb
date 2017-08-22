module Stepable

  def moves
    moves = []

    move_deltas.each do |(dx, dy)|
      x, y = pos
      new_pos = [x + dx, y + dy]
      moves << new_pos if board.in_bounds?(new_pos) && (board[new_pos].empty? || board[new_pos].color != color)
    end

    moves
  end

end
