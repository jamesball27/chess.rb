require_relative 'piece'
require_relative 'stepable'

class King < Piece

  include Stepable

  def move_deltas
    [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]
  end

  def symbol
    "K"
  end

end
