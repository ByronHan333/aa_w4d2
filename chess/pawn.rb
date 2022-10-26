require_relative 'piece'

class Pawn < Piece
    
    def symbol
        color
    end

    def moves
        valid_moves
    end
    
    private

    def valid_moves
        pot_side_steps = self.side_attacks

        current_symbol = self.symbol
        other_symbol = current_symbol=='w' ? 'b' : 'w'

        side_steps = self.side_attacks.select{|pos| within_bound?(pos)}
        side_steps = side_steps.select{|s| board[s].symbol==other_symbol}

        forward_steps = self.forward_steps.select{|pos| within_bound?(pos)}
        side_steps+forward_steps
    end

    def at_start_row?
        if symbol == 'w'
            return self.pos[0] == 1
        else
            return self.pos[0] == 6
        end
    end
    
    def within_bound?(pos)
        pos.all? {|p| p.between?(0,7)}
    end

    def forward_steps
        res = []
        row, col = self.pos
        res << [row+1, col] if symbol=='w' && board[[row+1,col]].is_a?(NullPiece)
        res << [row+2, col] if symbol=='w' && board[[row+1,col]].is_a?(NullPiece) && board[[row+2,col]].is_a?(NullPiece) && at_start_row? 

        res << [row-1, col] if symbol=='b' && board[[row-1,col]].is_a?(NullPiece)
        res << [row-2, col] if symbol=='w' && board[[row-1,col]].is_a?(NullPiece) && board[[row-2,col]].is_a?(NullPiece) && at_start_row? 

        res
    end

    def side_attacks
        res = []
        row, col  = self.pos
        res << [row+1, col-1] << [row+1, col+1] if symbol=='w'
        res << [row-1, col-1] << [row-1, col+1] if symbol=='b'
        res
    end
 
end