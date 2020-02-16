require_relative 'modules/slideable'
require_relative 'piece'

class Bishop < Piece
  include Slideable

  def move_deltas
    diagonal_deltas
  end

  def symbol
    '♝'.colorize(color)
  end
end
