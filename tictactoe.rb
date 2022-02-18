class TicTacToe
    def initialize
        @grid = Array.new(3) { Array.new(3, " ") }
    end

    # def create_grid()

    #     grid = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    #     return grid
        
    # end

    def update_grid(userInput)
        @grid[0][0] = "X"
        return @grid
    end
 
    def draw_grid(userInput)
        update_grid(userInput)
        puts "\n"
        puts " #{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]}"
        puts "-----------"
        puts " #{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]}"
        puts "-----------"
        puts " #{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]}"
        return @grid
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

    def player1_first_move(player1)
        print "#{player1} Enter the row for your move: "
        row = gets.chomp.to_i

        print "Enter the column for your move : "
        column = gets.chomp.to_i
        grid = @grid
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