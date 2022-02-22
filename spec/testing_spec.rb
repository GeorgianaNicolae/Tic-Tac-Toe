require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end

    it "updates the grid with an X using row and column arguments" do
        result = @tictactoe.update_grid(1, 1)
        expect(result).to eq([["X", " ", " "], [" "," "," "], [" "," "," "]])
    end

    it "updates the grid with an X on the first call and an O on the second call" do
        result = @tictactoe.update_grid(1, 1)
        expect(result).to eq([["X", " ", " "], [" "," "," "], [" "," "," "]])
        result2 = @tictactoe.update_grid(2, 1)
        expect(result2).to eq([["X", " ", " "], ["O"," "," "], [" "," "," "]])
    end

    it "returns true if it is player1's turn (turn is an odd number)" do
        result = @tictactoe.player1turn?
        expect(result).to eq(true)
    end

    it "returns false if it is not player1's turn (turn is an even number)" do
        turn1 = @tictactoe.update_grid(1, 1)
        result = @tictactoe.player1turn?
        expect(result).to eq(false)
    end

    it "updates grid with an O if turn is an even number and X if turn is an odd number" do
        turn1 = @tictactoe.update_grid(1, 1)
        turn2 = @tictactoe.update_grid(1, 2)
        turn3 = @tictactoe.update_grid(1, 3)
        result = @tictactoe.update_grid(3, 1)
        expect(result).to eq([["X", "O", "X"], [" "," "," "], ["O"," "," "]])
    end

    it "returns no instead of updating grid if the selected space is already taken" do
        @tictactoe.update_grid(1, 1)
        result = @tictactoe.update_grid(1, 1)
        expect(result).to eq("Choose another square")
    end

    it "returns true if the grid square is not an empty string" do
        @tictactoe.update_grid(1, 1)
        result = @tictactoe.square_already_taken?(1, 1)
        expect(result).to eq(true)
    end

    it "checks if grid is full" do
        @tictactoe.grid = [["X", "O", "X"], ["X", "O", "X"], ["X", "O", "X"]]
        result = @tictactoe.grid_full?
        expect(result).to eq(true)
    end

   it "checks if all elements in a row are equal" do
        result = @tictactoe.all_equal?
        expect(result).to eq(true)
    end
    # it "checks for a winner by the rows" do
    # @tictactoe.grid = [["X", "X", "X"], ["X", "O", "X"], ["X", "O", "X"]]

    # result = @tictactoe.check_rows
    # except(result).to eq(true)
    # end
end

#     it "gets player 1 to play their first move by stating the row and the column" do
#         grid = @tictactoe.create_grid
#         result = @tictactoe.player1_first_move("Betty", grid)

#         expect(result).to eq([[" ", " ", "X"], [" "," "," "], [" "," "," "]])
#     end 