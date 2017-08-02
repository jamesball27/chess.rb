require_relative 'pieces'

class Board

  attr_reader :grid

  def initialize
    make_starting_grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise "There is no piece on selected position" unless piece
    raise "Cannot move to selected position" if self[end_pos]
    self[start_pos] = nil
    self[end_pos] = piece
    grid
  end

  def in_bounds?(pos)
    pos.all? { |n| n.between?(0, 7) }
  end

  protected

  def make_starting_grid
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }

    [:white, :black].each do |color|
      fill_back_row(color)
      fill_pawns(color)
    end
  end

  def fill_back_row(color)
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    i = color == :white ? 7 : 0
    pieces.each_with_index do |piece, j|
      self[[i, j]] = piece.new([i, j], self, color)
    end
  end

  def fill_pawns(color)
    i = color == :white ? 6 : 1
    8.times { |j| self[[i, j]] = Pawn.new([i, j], self, color) }
  end
end
