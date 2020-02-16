require 'io/console'

KEYMAP = {
  ' ' => :space,
  'h' => :left,
  'j' => :down,
  'k' => :up,
  'l' => :right,
  'w' => :up,
  'a' => :left,
  's' => :down,
  'd' => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}.freeze

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0],
}.freeze

class Cursor
  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected = false
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  def selected?
    selected
  end

  private

  attr_accessor :selected

  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e"
      begin
        input << STDIN.read_nonblock(3)
      rescue StandardError
        nil
      end
      begin
        input << STDIN.read_nonblock(2)
      rescue StandardError
        nil
      end
    end

    STDIN.echo = true
    STDIN.cooked!

    input
  end

  def handle_key(key)
    case key
    when :space, :return
      toggle_selected!
      cursor_pos
    when :left, :right, :up, :down
      update_pos(MOVES[key])
    when :ctrl_c
      Process.exit(0)
    end
  end

  def update_pos(diff)
    x, y = cursor_pos
    dx, dy = diff
    new_pos = [x + dx, y + dy]
    @cursor_pos = new_pos if board.in_bounds?(new_pos)
    nil
  end

  def toggle_selected!
    self.selected = !selected
  end
end
