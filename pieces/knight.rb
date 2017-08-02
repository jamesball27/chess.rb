require_relative 'piece'
require_relative 'stepable'

class Knight < Piece

  include Stepable

  def move_deltas
    [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2],
      [2, -1],
      [2, 1]
    ]
  end

  def symbol
    "N"
  end

end
