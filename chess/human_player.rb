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
    start_position = display.cursor.get_input
    
    until start_position 
      puts "Enter valid input."
      start_position = display.cursor.get_input
      start_piece = board[[start_position]]
    end
    
    row, col = start_position
    print "#{row}, #{col} \n"
    piece = board[[row,col]]



    end_position = display.cursor.get_input
    until end_position
      puts "Enter valid input."
      end_position = display.cursor.get_input
    end
    row, col = end_position
    print "#{row}, #{col} \n"

    
    board.move_piece()
  end
end

b = Board.new
display = Display.new(b)

human = HumanPlayer.new(:white, display)
human.make_move(b)

# human.make_move(b)
