require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end

    it "returns 3 arrays with 3 nil values in each array within an array" do
        # Act
        result = @tictactoe.get_grid()

        # Assert
        expect(result).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end 

    it "starts the game by receiving the name of the player as a string and places an 'X' in the top left of the grid" do
        # Act
        result = @tictactoe.update_grid("Malcolm")

        # Assert
        expect(result).to eq([["X", nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end 
end