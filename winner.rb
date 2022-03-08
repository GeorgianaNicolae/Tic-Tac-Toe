require './grid'

class Winner 
    def all_equal?(row)
        row.each_cons(2).all? { |x,y| x == y }
    end

    def check_rows_equal
        @grid.each { |row| return row.first if all_equal?(row) }
        return false
    end

    def check_columns_equal
        @grid.transpose.each { |row| return row.first if all_equal?(row)}
        return false 
    end

    def check_diagonals_equal
        diagonals = [
            [@grid[0][0], @grid[1][1], @grid[2][2]],
            [@grid[0][2], @grid[1][1], @grid[2][0]]
        ]
        
        diagonals.each { |row| return row.first if all_equal?(row) }
        return false
    end

    def check_winner   
        winning_line = check_rows_equal || check_columns_equal || check_diagonals_equal
        if winning_line == "X"
            return "Player1 wins"
        elsif winning_line == "O"
            return "Player2 wins"
        end
        return false
    end
end