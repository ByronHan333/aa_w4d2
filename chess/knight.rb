require_relative 'piece'
require_relative 'stepable'
require 'colorize'

class Knight < Piece
    include Stepable

    def symbol
        "♘".colorize(self.color)
    end

    private

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
