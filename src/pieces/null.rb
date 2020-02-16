require 'singleton'

class NullPiece < Piece
  include Singleton

  def initialize; end

  def empty?
    true
  end

  def symbol
    ' '
  end
end
