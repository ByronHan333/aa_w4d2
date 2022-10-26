require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
    include Slideable

    def symbol
        return symbol
    end
    
    attr_accessor :symbol

    private

    def move_dirs
        
    end
end