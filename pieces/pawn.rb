require_relative 'piece'

class Pawn < Piece

  def moves
    forward_steps + side_attacks
  end

  def symbol
    "♟".colorize(color)
  end

  def at_start_row?
    (color == :white && pos.first == 6) || (color == :black && pos.first == 1)
  end

  def forward_dir
    color == :white ? -1 : 1
  end

  def forward_steps
    moves = []
    x, y = pos
    one_step = [forward_dir + x, y]
    two_step = [(2 * forward_dir) + x, y]
    moves << one_step if board.in_bounds?(one_step)
    moves << two_step if at_start_row?
    moves
  end

  def side_attacks
    x, y = pos

    side_moves = [[x + forward_dir, y - 1], [x + forward_dir, y + 1]]

    side_moves.select do |pos|
      board.in_bounds?(pos) && !board[pos].empty? && board[pos].color != color
    end
  end

end
