module Stepable

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
