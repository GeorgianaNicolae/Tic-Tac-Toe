require './players'

class Grid 
    attr_accessor :grid

    def initialize
        @grid = Array.new(3) { Array.new(3, " ") }
        @turn = 1
    end

    def update_turn
        @turn += 1
    end

    def square_already_taken?(row, column)
        @grid[row-1][column-1] != " "
    end

    def player1turn?
        @turn % 2 != 0
    end

    def which_symbol
        player1turn? ? @player1symbol : @player2symbol
    end

    def grid_full?
        !@grid.include?(" ")
    end

    def get_move
        print "Enter the row for your move: "
        row = gets.chomp.to_i

        print "Enter the column for your move : "
        column = gets.chomp.to_i
        
        return row, column
    end

    # take out the top return statement and have the controller 
    # check if square is already taken 
    # if so then go back to user, if not then update_grid

    # update turn to be removed when ATDD it's implemented
    def update_grid(row, column)
        return "Choose another square" if square_already_taken?(row, column)
        @grid[row-1][column-1] = which_symbol
        update_turn
        return @grid
    end
end