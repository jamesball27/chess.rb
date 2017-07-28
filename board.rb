require_relative 'piece'
require 'byebug'

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
    grid = Array.new(8) { Array.new(8) }
    [0, 1, 6, 7].each do |i|
      grid[i].map! { Piece.new }
    end
    grid
  end

end
