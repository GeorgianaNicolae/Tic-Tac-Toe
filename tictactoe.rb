class TicTacToe
    def initialize
        @grid = Array.new(3) { Array.new(3, " ") }
    end

    def update_grid(userInput)
        @grid[0][0] = "X"
        return @grid
    end
 
    def draw_grid(userInput)
        update_grid(userInput)
        grid_string = @grid.join("|")
        grid_string[5] = "\n"
        grid_string[11] = "\n"
        puts "\n\n" + grid_string + "\n\n"
        return grid_string
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


end