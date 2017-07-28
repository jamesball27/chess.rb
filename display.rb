require 'colorize'
require_relative 'cursor'

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
        piece = board[pos].to_s
        if pos == cursor.cursor_pos
          color = cursor.selected? ? :green : :yellow
          piece = piece.colorize(background: color)
        end
        row << piece
      end
      puts row
    end
    nil
  end

  def display_loop
    loop do
      render
      cursor.get_input
    end
  end
end
