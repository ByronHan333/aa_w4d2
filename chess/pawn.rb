require_relative 'piece'

class Pawn < Piece

    def moves
        pot_side_steps = self.side_attacks

        current_color = self.symbol
        other_color = current_symbol=='w' ? 'b' : 'w'

        side_steps = self.side_attacks.select{|pos| within_bound?(pos)}
        side_steps = side_steps.select{|s| board[s].color==other_color}

        forward_steps = self.forward_steps.select{|pos| within_bound?(pos)}
        side_steps+forward_steps
    end

    def symbol
        "♟".colorize(self.color)
    end

    private

    def valid_moves
    end

    def at_start_row?
        if color == 'w'
            return self.pos[0] == 1
        else
            return self.pos[0] == 6
        end
    end

    def forward_steps
        res = []
        row, col = self.pos
        res << [row+1, col] if color=='w' && board[[row+1,col]].is_a?(NullPiece)
        res << [row+2, col] if color=='w' && board[[row+1,col]].is_a?(NullPiece) && board[[row+2,col]].is_a?(NullPiece) && at_start_row?

        res << [row-1, col] if color=='b' && board[[row-1,col]].is_a?(NullPiece)
        res << [row-2, col] if color=='w' && board[[row-1,col]].is_a?(NullPiece) && board[[row-2,col]].is_a?(NullPiece) && at_start_row?

        res
    end

    def side_attacks
        res = []
        row, col  = self.pos
        res << [row+1, col-1] << [row+1, col+1] if color=='w'
        res << [row-1, col-1] << [row-1, col+1] if color=='b'
        res
    end

end
