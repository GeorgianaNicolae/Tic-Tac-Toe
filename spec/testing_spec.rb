require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end

    it "updates the grid with an X using row and column arguments" do
        result = @tictactoe.update_grid(1, 1)
        expect(result).to eq([["X", " ", " "], [" "," "," "], [" "," "," "]])
    end

    it "updates the grid with an O on the second call" do
        turn1 = @tictactoe.update_grid(1, 1)
        result = @tictactoe.update_grid(2, 1)
        expect(result).to eq([["X", " ", " "], ["O"," "," "], [" "," "," "]])
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
        expect{@tictactoe.update_grid(1, 1)}.to output("Choose another square") .to_stdout
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

   it "returns true when all elements in a row are equal" do
        row = ["X", "X", "X"]
        result = @tictactoe.all_equal?(row)
        expect(result).to eq(true)
    end

    it "returns false when elements in a row aren't equal" do
        row = ["X", "X", " "]
        result = @tictactoe.all_equal?(row)
        expect(result).to eq(false)
    end

    it "returns X if all items in the first array are the same" do
        @tictactoe.grid = [["X", "X", "X"], ["X", "O", "X"], ["X", "O", "X"]]

        result = @tictactoe.check_rows_equal
        expect(result).to eq("X")
    end

    it "returns O if all items in the second array are the same" do
        @tictactoe.grid = [["X", "O", "X"],["O", "O", "O"], ["X", "O", "X"]]

        result = @tictactoe.check_rows_equal
        expect(result).to eq("O")
    end

    it "returns X if all items in the first columnn are equal" do
        @tictactoe.grid = [["X", "O", "X"],["X", "O", "O"], ["X", "O", "X"]]

        result = @tictactoe.check_columns_equal
        expect(result).to eq("X")
    end

    it "returns O if all items in the second columnn are equal" do
        @tictactoe.grid = [["X", "O", "X"],["X", "O", "O"], ["X", "O", "X"]]

        result = @tictactoe.check_columns_equal
        expect(result).to eq("X")
    end

    it "returns false if not all items in an row are equal" do
        @tictactoe.grid = [["X", "X", "O"], ["X", "O", "X"], ["X", "O", "X"]]

        result = @tictactoe.check_rows_equal
        expect(result).to eq(false)
    end

    it "returns false if not all items in an column are equal" do
        @tictactoe.grid = [["X", "O", "X"],["X", "O", "O"], ["O", "X", "X"]]

        result = @tictactoe.check_columns_equal
        expect(result).to eq(false)
    end

    it "returns X if all items on the diagonal starting from the top left are equal" do
        @tictactoe.grid = [["X", "O", "X"],["X", "X", "O"], ["O", "X", "X"]]

        result = @tictactoe.check_diagonals_equal
        expect(result).to eq("X")
    end

    it "returns O if all items on the diagonal starting from the top right are equal" do
        @tictactoe.grid = [["X", "O", "O"],["X", "O", "O"], ["O", "X", "X"]]

        result = @tictactoe.check_diagonals_equal
        expect(result).to eq("O")
    end

    it "returns false if not all items in the diagonal are equal" do
        @tictactoe.grid = [["X", "O", "X"], ["X", "O", "O"], ["O", "X", "X"]]

        result = @tictactoe.check_diagonals_equal
        expect(result).to eq(false)
    end

    it "returns 'Player1 wins' if any of the winner cases are met" do
        @tictactoe.grid = [["X", "X", "X"], ["X", "O", " "], ["O", "X", "X"]]

        result = @tictactoe.check_winner
        expect(result).to eq("Player1 wins")
    end

    it "returns 'Player2 wins' if any of the winner cases are met" do
        @tictactoe.grid = [["X", "O", "O"],["X", "O", "O"], ["O", "X", "X"]]

        result = @tictactoe.check_winner
        expect(result).to eq("Player2 wins")
    end

    it "returns false if no winner cases are met" do
        @tictactoe.grid = [["X", "O", "X"], [
                            "X", "O", "O"], 
                            ["O", "X", "X"]]

        result = @tictactoe.check_winner
        expect(result).to eq(false)
    end

    it "asks the user to input a row number and returns it" do
        allow(@tictactoe).to receive(:gets).and_return("1")
        result = @tictactoe.get_row
        expect(result).to eq(1)
    end 

    it "asks the user to input a column number and returns it" do
        allow(@tictactoe).to receive(:gets).and_return("1")
        result = @tictactoe.get_column
        expect(result).to eq(1)
    end 

    it "asks player1 to input their name" do 
        allow(@tictactoe).to receive(:gets).and_return("Rachel")
        result = @tictactoe.get_player1_name
        expect(result).to eq("Rachel")
    end 

    it "asks player2 to input their name" do 
        allow(@tictactoe).to receive(:gets).and_return("Betty")
        result = @tictactoe.get_player2_name
        expect(result).to eq("Betty")
    end 

    it "informs the players of their symbols" do 
       @tictactoe.player1 = "Betty"
       @tictactoe.player2 = "Rachel"
       expect{@tictactoe.give_players_symbols}.to output("#{@tictactoe.player1}, you are X and #{@tictactoe.player2}, you are O") .to_stdout
    end 
end