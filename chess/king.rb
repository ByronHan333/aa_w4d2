require_relative 'piece'
require_relative 'stepable'

class King < Piece
    include Stepable
    
    def symbol
        return symbol
    end

    private 
    
    def move_dirs
        
    end
end