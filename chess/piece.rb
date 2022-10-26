require 'colorize'

class Piece
    attr_reader :pos, :color, :board

    def initialize(color, board, pos)
        @color = color == 'w' ? :white : :black
        @board = board
        @pos = pos
    end

    def to_s
        " #{symbol} "
    end

    def empty?(pos)
        board[pos].is_a?(NullPiece)
    end

    def opponent?(pos)
        current_color = color
        current_color != board[pos].color
    end

    def valid_moves

    end

    def within_bound?(pos)
        pos.all? {|p| p.between?(0,7)}
    end

    def pos=(val)
        @pos = val
    end

    private
    def move_into_check?(end_pos)

    end

end
