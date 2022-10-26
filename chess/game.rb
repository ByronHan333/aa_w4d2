require_relative 'human_player'

class Game
  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new
    @player2 = HumanPlayer.new
  end

  def switch_player

  end

  def play

  end
end
