require_relative 'pieces'

class Board

  attr_reader :grid

  def initialize
    @grid = make_starting_grid
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
    null_piece = NullPiece.instance
    grid = Array.new(8) { Array.new(8, null_piece) }

    back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    back_row.each_with_index do |piece, j|
      [:white, :black].each do |color|
        i = color == :white ? 7 : 0
        grid[i][j] = piece.new([i, j], self, color)
      end
    end

    [1, 6].each do |i|
      color = i == 1 ? :black : :white
      8.times do |j|
        grid[i][j] = Pawn.new([i, j], self, color)
      end
    end
    
    grid
  end

end
