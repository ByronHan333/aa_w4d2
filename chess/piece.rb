require 'colorize'

class Piece
    attr_reader :pos, :color, :board

    def initialize(color, board, pos)
        @color = color
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

    def within_bound?(pos)
        pos.all? {|p| p.between?(0,7)}
    end

    def pos=(val)
        @pos = val
    end

    def moves
        # good moves, move that are valid, and not result in check mate
        grow_unblocked_moves_in_dir.select do |pos|
            within_bound?(pos) && (empty?(pos) || opponent?(pos)) && !move_into_check?(pos)
        end
    end

    # private

    def valid_moves
        # valid move, all allowed moves.
        grow_unblocked_moves_in_dir.select do |pos|
            within_bound?(pos) && (empty?(pos) || opponent?(pos))
        end
    end

    def move_into_check?(end_pos)
        dup_board = board.dup
        piece = dup_board[pos]
        dup_board[end_pos] = piece
        dup_board[pos] = dup_board.null_piece
        dup_board.in_check?(color)
    end



end
