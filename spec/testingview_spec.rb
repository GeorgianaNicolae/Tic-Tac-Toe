require "./tictactoeview"

require "./tictactoe"

describe TicTacToeView do 

    before (:each) do

        @tictactoe = described_class.new
        @tictactoeview = described_class.new

    end

    it "prints a grid to the terminal" do
        grid = [["X", " ", " "], [" "," "," "], [" "," "," "]]
        result = @tictactoeview.draw_grid(grid)

        expect(result).to eq(result)

    end
   
end