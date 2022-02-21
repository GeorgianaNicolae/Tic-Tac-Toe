class TicTacToe
    # def initialize
    #     @grid = Array.new(3) { Array.new(3, " ") }
    # end

    def create_grid
        grid = Array.new(3) { Array.new(3, " ") }
        return grid     
    end

    def update_grid(userInput, grid)
        grid[0][0] = "X"
        return grid
    end

    def get_player1_name()
        print "Player 1 enter your name: "
        player1 = gets.chomp
        puts "#{player1} you are playing with symbol X"
        return player1
    end 

    def get_player2_name()
        print "Player 2 enter your name: "
        player2 = gets.chomp
        puts "#{player2} you are playing with symbol O"
        return player2
    end 

    def player1_first_move(player1, grid)
        print "#{player1} Enter the row for your move: "
        row = gets.chomp.to_i

        print "Enter the column for your move : "
        column = gets.chomp.to_i
        grid[row-1][column-1] = "X"
        puts grid
        return grid
    end

    # def play_whole_game()

    #     grid = @tictactoe.create_grid()
        
    #     [row, column] = player_move(player)

    #     grid = update_grid(player, grid, row, column)

    #     draw_grid(grid)

    #     check_if_winner()

    #     player2_move

        
    # end
end