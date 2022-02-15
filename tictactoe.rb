class TicTacToe
    @@grid = []

    def get_grid()
        @@grid = Array.new(3) { Array.new(3) }
        return @@grid
    end

    def update_grid(nameOfPlayer)
        @@grid[0][0] = "X"
        return @@grid 
    end
end