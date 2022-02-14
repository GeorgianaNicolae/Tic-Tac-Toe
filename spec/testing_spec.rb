require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end

    it "returns 3 empty arrays with an array" do
        # Act
        result = @tictactoe.get_grid()

        # Assert
        expect(result).to eq([[], [], []])
    end 
end 