require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end

    it "returns an empty array" do
        # Act
        result = @tictactoe.get_grid()

        # Assert
        expect(result).to eq([])
    end 
end 