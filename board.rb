require_relative 'pieces'
require 'byebug'
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
    raise "There is no piece on selected position" if piece.empty?

    if !piece.moves.include?(end_pos)
      raise "Invalid move"
    elsif !piece.valid_moves.include?(end_pos)
      raise "Move would place you in check"
    end

    move_piece!(start_pos, end_pos) 
  end

  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    self[start_pos] = NullPiece.instance
    self[end_pos] = piece
    grid
  end

  def in_bounds?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def checkmate?(color)
    in_check?(color) && pieces_by_color(color).all? { |piece| piece.valid_moves.empty? }
  end

  def in_check?(color)
    king = find_king(color)
    opponent_color = color == :white ? :black : :white
    opponent_pieces = pieces_by_color(opponent_color)
    opponent_pieces.any? { |piece| piece.moves.include?(king) }
  end

  def find_king(color)
    king = pieces_by_color(color).find { |piece| piece.is_a?(King) }
    raise "King not found" unless king
    king.pos
  end

  def all_pieces
    grid.flatten.reject(&:empty?)
  end

  def pieces_by_color(color)
    all_pieces.select { |piece| piece.color == color }
  end

  def dup
    new_board = Board.new
    new_board.grid.each_with_index do |row, i|
      row.each_index do |j|
        pos = [i, j]
        piece = self[pos]
        new_board[pos] = piece.class.new(pos, new_board, piece.color) unless piece.empty?
      end
    end
    new_board
  end

  protected

  def make_starting_grid
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }

    [:white, :black].each do |color|
      fill_back_row(color)
      fill_pawns(color)
    end

    grid
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
