require_relative 'cursor'
require_relative 'board'
require_relative 'display'

class HumanPlayer
  attr_reader :display, :color
  def initialize(color, display)
    @color = color
    @display = display
  end

  def board
    display.board
  end

  def make_move()
    self.display.render

    start_pos = display.cursor.get_input
    start_piece = nil
    until start_piece
      puts "Enter valid input."
      start_pos = display.cursor.get_input
      start_piece = board[start_pos] if start_pos
      start_piece = nil if start_piece.color != color
    end

    print "start piece: #{start_pos} \n"

    end_pos = nil
    until end_pos
      puts "Enter valid input."
      end_pos = display.cursor.get_input
    end

    print "end position: #{end_pos} \n"

    board.move_piece(color, start_pos, end_pos)

    self.display.render
  end
end

b = Board.new
# b.move_piece(:white, [0,1], [2,0])
display = Display.new(b)
human = HumanPlayer.new(:white, display)
human.make_move()
# display.render
# human.make_move(b)
