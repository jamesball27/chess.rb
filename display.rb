require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display

  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    system("clear")
    (0..7).each do |i|
      row = ""
      (0..7).each do |j|
        pos = [i, j]
        square = board[pos].to_s.colorize(background: background_color(pos))
        row << square
      end
      puts row
    end

    nil
  end

  private

  def background_color(pos)
    x, y = pos
    color = (x.even? && y.even?) || (x.odd? && y.odd?) ? :white : :black

    if pos == cursor.cursor_pos
      color = cursor.selected? ? :green : :yellow
    end

    color
  end

end

b = Board.new
d = Display.new(b)
loop do
  d.render
  d.cursor.get_input
end
