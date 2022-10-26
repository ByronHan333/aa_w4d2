require_relative 'pieces_required'

class Board

    def self.setup_board(board)
        board.rows.each_with_index do |row, i|
            row.each_with_index do |col, j|
                board[[i,j]] = Pawn.new('w', board, [i,j]) if i==1
                board[[i,j]] = Pawn.new('b', board, [i,j]) if i==6
                board[[i,j]] = board.null_piece if i.between?(2,5)
                board[[i,j]] = Rook.new('w', board, [i,j]) if (i==0 &&j==0) || (i==0 &&j==7)
                board[[i,j]] = Rook.new('b', board, [i,j]) if (i==7 &&j==0) || (i==7 &&j==7)

                board[[i,j]] = Knight.new('w', board, [i,j]) if (i==0 &&j==1) || (i==0 &&j==6)
                board[[i,j]] = Knight.new('b', board, [i,j]) if (i==7 &&j==1) || (i==7 &&j==6)

                board[[i,j]] = Bishop.new('w', board, [i,j]) if (i==0 &&j==2) || (i==0 &&j==5)
                board[[i,j]] = Bishop.new('b', board, [i,j]) if (i==7 &&j==2) || (i==7 &&j==5)

                board[[i,j]] = Queen.new('w', board, [i,j]) if (i==0 &&j==3) 
                board[[i,j]] = Queen.new('b', board, [i,j]) if (i==7 &&j==3) 

                board[[i,j]] = King.new('w', board, [i,j]) if (i==0 &&j==4) 
                board[[i,j]] = King.new('b', board, [i,j]) if (i==7 &&j==4) 

            end
        end
    end

    attr_accessor :rows, :null_piece
    def initialize()
        @rows = Array.new(8) {Array.new(8, nil)}
        @null_piece  = NullPiece.instance
        Board.setup_board(self)

    end

    def [](pos)
        row,col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row,col = pos
        @rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)
        raise 'No piece at start position' if self[start_pos].is_a?(NullPiece)
        raise 'Out of bounds' if !valid_pos?(start_pos) || !valid_pos?(end_pos)
        #raise 'Not allowed to move piece this way' #move_dir
        piece = self[start_pos]
        self[end_pos] = piece
        piece.pos = end_pos
        self[start_pos] = @null_piece

        # if piece.moves(start_pos, end_pos)
        #     self[end_pos] = piece
        #     piece.pos = end_pos
        #     self[start_pos] = @null_piece
        # else
        #     #output we cannot move
        # end

    end

    def valid_pos?(pos)
        pos.all?{|i| i.between?(0,7)}
    end

    def add_piece(piece, pos)

    end

    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)

    end

    def pieces 

    end

    def dup 

    end

    def move_piece!(color, start_pos, end_pos)

    end
    # private :null_piece
end