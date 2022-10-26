require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
    include Stepable

    def moves
        possible_moves.select do |pos|
            within_bound?(pos) && (empty?(pos) || opponent?(pos))
        end
    end

    private

    def valid_moves
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
            [1, 2],
            [1, -2],
            [-1, 2],
            [-1, -2],
            [2, 1],
            [2, -1],
            [-2, 1],
            [-2, -1]
        ]
    end
end
