require 'byebug'
class Piece

  attr_reader :pos, :board, :color

  def initialize(pos, board, color = nil)
    @pos = pos
    @board = board
    @color = color
  end

  def valid_moves
    moves.reject { |move| move_into_check?(move) }
  end

  def move_into_check?(end_pos)
    new_board = board.dup
    new_board.move_piece(pos, end_pos)
    new_board.in_check?(color)
  end

  def empty?
    false
  end

  def to_s
    " #{symbol}  "
  end

  def inspect
    "#{self.class}, #{pos}, #{color}"
  end
end
