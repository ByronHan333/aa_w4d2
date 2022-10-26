module Stepable
    
    def moves
        grow_unblocked_moves_in_dir.select do |pos|
            within_bound?(pos) && (empty?(pos) || opponent?(pos))
        end
    end

    def grow_unblocked_moves_in_dir
        # generate an array of all possible moves
        curren_pos = self.pos
        row, col = curren_pos
        res = []
        self.move_diffs.each do |dy, dx|
            res << [row+dy, col+dx]
        end
        res
    end

    private
    def move_diffs
        raise "implement move diffs"
    end
end
