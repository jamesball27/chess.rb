class Piece

  attr_reader :pos, :board, :color

  def initialize(pos, board, color = nil)
    @pos = pos
    @board = board
    @color = color
  end

  def valid_moves
  end

  def empty?
    false
  end

  def to_s
    " #{symbol} "
  end

end
