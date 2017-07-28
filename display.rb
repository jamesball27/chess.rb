require 'colorize'
require_relative 'cursor'

class Display

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
  end
end
