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

    def get_players
        puts "Player 1 - enter your name"
        @player1 = gets.chomp
        puts "Player 2 - enter your name"
        @player2 = gets.chomp
        return "#{@player1}, you are '#{@player1symbol}' and #{@player2}, you are '#{@player2symbol}'"
    end

    def grid_full?
        result = true
        @grid.each do |array|
            array.each do |item|
                if item == " "
                    result = false
                end
            end
        end
        return result
    end

    def all_equal?(row)
        # return if row.first == " "
        row.each_cons(2).all? { |x,y| x == y }
    end

    # def check_rows
    #     @grid.each { |row| row.equal? }

    # end

    
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