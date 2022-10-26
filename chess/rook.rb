require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
    include Slideable

    private

    def move_dirs
        horizontal_dirs
    end
end
