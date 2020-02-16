require_relative 'piece'
require_relative 'modules/slideable'

class Queen < Piece
  include Slideable

  def move_deltas
    perpendicular_deltas + diagonal_deltas
  end

  def symbol
    '♛'.colorize(color)
  end
end
