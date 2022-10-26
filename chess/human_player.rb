require_relative 'cursor'
require_relative 'board'
require_relative 'display'

class HumanPlayer
  attr_reader :display, :color
  def initialize(color, display)
    @color = color
    @display = display
  end

  def make_move(board)
    position = display.cursor.get_input
    until position
      puts "Enter valid input."
      position = display.cursor.get_input
    end
    row, col = position
    print "#{row}, #{col} \n"
  end
end

b = Board.new
display = Display.new(b)

human = HumanPlayer.new(:white, display)
human.make_move(b)
