class Piece 
    attr_reader :pos, :color, :board

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s 

    end

    def empty? 

    end

    def valid_moves 

    end

    def pos=(val)
        @pos = val
    end

    def symbol 
        return symbol
    end

    private
    def move_into_check?(end_pos)

    end

end