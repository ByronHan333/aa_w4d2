module Slideable
    HORIZONTAL_DIRS = Array.new
    DIAGONAL_DIRS = Array.new

    def horizontal_dirs
        [
            [1, 0],
            [-1, 0],
            [0, 1],
            [0, -1]
        ]
    end

    def diagonal_dirs
        [
            [1, 1],
            [1, -1],
            [-1, 1],
            [-1, -1]
        ]
    end

    private

    def move_dirs
        raise "implement own move_dirs"
    end

    def grow_unblocked_moves_in_dir
        res = []
        move_dirs.each do |dy, dx|
            row, col = pos
            new_row = row + dy
            new_col = col + dx
            new_pos = [new_row, new_col]
            while within_bound?(new_pos)
                if empty?(new_pos)
                    res << new_pos
                elsif opponent?(new_pos)
                    res << new_pos
                    break
                else
                    break
                end
                new_row += dy
                new_col += dx
                new_pos = [new_row, new_col]
            end
        end
        res
    end
end
