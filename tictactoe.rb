class TicTacToe
    attr_accessor :grid

    def initialize
        @grid = Array.new(3) { Array.new(3, " ") }
        @player1 = ""
        @player2 = ""
        @player1symbol = "X"
        @player2symbol = "O"
        @turn = 1
    end

    def player1turn?
        @turn % 2 != 0
    end

    def square_already_taken?(row, column)
        @grid[row-1][column-1] != " "
    end

    def update_grid(row, column)
        return "Choose another square" if square_already_taken?(row, column)
        # instead of returning string we need to ask user to play again and get new input
        if player1turn?
          @grid[row-1][column-1] = "X"
        else
          @grid[row-1][column-1] = "O"
        end
        
        @turn += 1
        return @grid
    end

    # def get_players
    #     puts "Player 1 - enter your name"
    #     @player1 = gets.chomp
    #     puts "Player 2 - enter your name"
    #     @player2 = gets.chomp
    #     return "#{@player1}, you are '#{@player1symbol}' and #{@player2}, you are '#{@player2symbol}'"
    # end

    def grid_full?
        !@grid.include?(" ")
    end

    def all_equal?(row)
        # return false if row.first == " "
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

#     def player1_first_move(player1, grid)
#         print "#{player1} Enter the row for your move: "
#         row = gets.chomp.to_i

#         print "Enter the column for your move : "
#         column = gets.chomp.to_i
#         grid = @grid
#         grid[row-1][column-1] = "X"
#         puts grid
#         return grid

#         # update_grid(row, column, grid)
#     end