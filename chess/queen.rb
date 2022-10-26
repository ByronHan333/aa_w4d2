require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
    include Slideable

    def symbol
        "♕".colorize(self.color)
    end

    private

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end
