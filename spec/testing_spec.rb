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
end