require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def move_deltas
    perpendicular_deltas + diagonal_deltas
  end

  def symbol
    "Q"
  end
  
end
