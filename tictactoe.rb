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
        puts grid_string
        return grid_string
    end

    def get_player1_name()
        print "Player 1 enter your name: "
        player1 = gets.chomp
        puts "#{player1} you are playing with symbol X"

        return player1
    end 


end