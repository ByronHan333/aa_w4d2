require_relative 'piece'
require 'singleton'

class NullPiece < Piece
    include Singleton

    def initialize
        @color = nil
        @board = nil
        @pos = nil
    end

    def move

    end

    def symbol
        return " "
    end
end
