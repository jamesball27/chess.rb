require_relative 'board'
require_relative 'display'

class Game

  attr_reader :player_1, :player_2
  attr_writer :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player_1, @player_2 = HumanPlayer.new(:white, @display), HumanPlayer.new(:black, @display)
    @current_player = player_1
  end

  def play
    loop do
      current_player.play_turn
      switch_players!
    end
  end

  def switch_players!
    self.current_player = current_player == player_1 ? player_2 : player_1
  end

end
