module Stepable
  def moves
    moves = []

    move_deltas.each do |(dx, dy)|
      x, y = pos
      new_pos = [x + dx, y + dy]
      if board.in_bounds?(new_pos) && (board[new_pos].empty? || board[new_pos].color != color)
        moves << new_pos
      end
    end

    moves
  end
end
