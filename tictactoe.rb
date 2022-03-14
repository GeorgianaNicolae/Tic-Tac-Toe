class TicTacToe
    attr_accessor :grid
    attr_accessor :turn
    attr_accessor :player1
    attr_accessor :player2

    def initialize
        @grid = Array.new(3) { Array.new(3, " ") }
        @player1 = ""
        @player2 = ""
        @turn = 1
    end

    def play_game

        get_player1_name
        get_player2_name 
        give_players_symbols 

        draw_grid
        #display empty grid 
        # row = get_row
        # column = get_column

        #update grid 

        # display grid

      
        # player 2 enter row 
        # player 2 enter column

        # square already taken?
        # update grid
        # display grid

        # when to check grid full, square already taken and winner
    end 

    def player1turn?
        @turn % 2 != 0
    end

    def update_turn
        @turn += 1
    end

    def square_already_taken?(row, column)
        @grid[row][column] != " "
    end

    def which_symbol
        player1turn? ? "X" : "O"
    end

    def get_player1_name    
        print "Player 1 - enter your name : "
        @player1 = gets.chomp
    end

    def get_player2_name    
        print "Player 2 - enter your name : "
        @player2 = gets.chomp
    end

    def give_players_symbols 
        print "#{@player1}, you are X and #{@player2}, you are O"
    end
    
    def get_row
        print "Enter the row for your move: "
        row = gets.chomp.to_i - 1
    end

    def get_column
        print "Enter the column for your move : "
        column = gets.chomp.to_i - 1
    end

    # take out the top return statement and have the controller 
    # check if square is already taken 
    # if so then go back to user, if not then update_grid

    # update turn to be removed when ATDD it's implemented
    def update_grid(row, column)
        print "Choose another square" if square_already_taken?(row, column)
        @grid[row][column] = which_symbol
        update_turn
        return @grid
    end

    def grid_full?
        !@grid.include?(" ")
    end

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

    def draw_grid        
        puts "\n"
        puts " #{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]}"
        puts "-----------"
        puts " #{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]}"
        puts "-----------"
        puts " #{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]}"    
    end
end

 #TicTacToe.new.play_game