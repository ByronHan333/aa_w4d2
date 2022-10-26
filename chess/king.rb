require_relative 'piece'
require_relative 'stepable'

class King < Piece
    include Stepable
    
    def moves
        valid_moves
    end
    
    private

    def valid_moves
        possible_moves.select do |pos|
            within_bound?(pos) && (empty?(pos) || opponent?(pos))
        end
    end

    def possible_moves
        curren_pos = self.pos 
        row, col = curren_pos
        res = []
        self.move_diffs.each do |dx, dy|
            res << [row+dx, col+dy]
        end
        res
    end

    def move_diffs
        [
            [-1, -1],
            [-1, 0],
            [-1, 1],
            [0, -1],
            [0, 1],
            [1, -1],
            [1, 0],
            [1, 1]
        ]
    end
end