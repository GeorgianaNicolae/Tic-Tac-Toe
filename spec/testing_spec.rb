require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end

    it "starts the game by receiving the name of the player as a string and places an 'X' in the top left of the grid" do
        # Act
        result = @tictactoe.update_grid("Malcome")

        # Assert
        expect(result).to eq([["X", " ", " "], [" "," "," "], [" "," "," "]])
    end 

    it "joins the arrays with a pipe and returns a string then introduces a new line after each row to look like a grid" do
        # Act
        result = @tictactoe.draw_grid("Malcome")

        # Assert
        expect(result).to eq("X| | \n | | \n | | ")
    end 
end