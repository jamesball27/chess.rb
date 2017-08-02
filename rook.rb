require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def move_deltas
    perpendicular_deltas
  end

  def symbol
    "R"
  end

end
