require_relative 'piece'

class Pawn < Piece

  def moves
    forward_steps + side_attacks
  end

  def symbol
    "♟".colorize(color)
  end

  protected

  def at_start_row?
    (color == :white && pos.first == 6) || (color == :black && pos.first == 1)
  end

  def forward_dir
    color == :white ? 1 : -1
  end

  def forward_steps
    moves = []
    one_step = [[forward_dir, 0]]
    two_step = [2 * forward_dir, 0]
    moves << one_step if board.in_bounds(one_step)
    moves << two_step if at_start_row?
    moves
  end

  def side_attacks
    [[forward_dir, -1], [forward_dir, 1]].select do |pos|
      board.in_bounds?(pos) && (pos.color != color)
    end
  end

end
