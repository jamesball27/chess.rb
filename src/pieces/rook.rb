require_relative 'piece'
require_relative 'modules/slideable'

class Rook < Piece
  include Slideable

  def move_deltas
    perpendicular_deltas
  end

  def symbol
    '♜'.colorize(color)
  end
end
