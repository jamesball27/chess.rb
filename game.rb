require_relative 'board'
require_relative 'display'
require_relative 'human_player'
class Game

  attr_reader :player_1, :player_2, :board
  attr_accessor :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player_1, @player_2 = HumanPlayer.new(:white, @display), HumanPlayer.new(:black, @display)
    @current_player = player_1
  end

  def play
    until board.checkmate?(current_player.color)
      begin
        start_pos, end_pos = current_player.make_move
        board.move_piece(current_player.color, start_pos, end_pos)

        switch_players!
      rescue StandardError => e
        puts e.message
        retry
      end
    end

    display.render
    puts "#{current_player} is checkmated."

    nil
  end

  def switch_players!
    self.current_player = current_player == player_1 ? player_2 : player_1
  end

end

Game.new.play
