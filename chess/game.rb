require_relative 'human_player'
require_relative 'display'

class Game
  def initialize(board, display)
    @board = board
    @display = display
    @player1 = HumanPlayer.new(:white, @display)
    @player2 = HumanPlayer.new(:black, @display)
    @current_player = @player1
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def notify_player

  end

  def play

  end
end
