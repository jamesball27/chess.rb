class Piece

  attr_reader :pos, :board

  def initialize(pos, board)
    @pos = pos
    @board = board
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
