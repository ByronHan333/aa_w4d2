require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display

    attr_reader :cursor

    def initialize(board)
      @cursor = Cursor.new([0,0], board)
    end

    def board
      @cursor.board
    end

    def cursor_pos
      @cursor.cursor_pos
    end

    def build_grid
        board.rows.each_with_index do |row, i|
            build_row(row, i)
        end
    end

    def build_row(row, i)
        row.each_with_index do |piece, j|
            color_options = colors_for(i, j)
            # color_options = { background: :blue, color: :black }
            # puts piece
            # puts piece.to_s
            # puts piece.to_s.colorize({ background: :blue, color: :white })
            print piece.to_s.colorize(color_options)
        end
        puts
    end

    def colors_for(i, j)
        if [i, j] == cursor_pos && @cursor.selected
          bg = :yellow
        elsif [i, j] == cursor_pos
            bg = :light_red
        elsif (i + j).odd?
            bg = :light_blue
        else
            bg = :blue
        end
        { background: bg, color: :white }
    end

    def render
      system("clear")
      # puts "Fill the grid!"
      # puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
      # build_grid.each { |row| puts row.join }
      build_grid
    end
end
# Collapse

# b = Board.new()
# king = b[[0,4]]
# display = Display.new(board)
# display.render
# p king.move_into_check?([4,5])

# board = Board.new()

# board.move_piece('w', [0,0], [2,2])
# cursor = Cursor.new([0,0], board)
# display = Display.new(board)

# display.cursor.get_input
# display.render
