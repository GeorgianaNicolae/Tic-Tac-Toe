require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end

    it "starts the game by receiving the name of the player as a string and places an 'X' in the top left of the grid" do
        result = @tictactoe.update_grid("Malcome")

        expect(result).to eq([["X", " ", " "], [" "," "," "], [" "," "," "]])
    end

    it "joins the arrays with a pipe and returns a string then introduces a new line after each row to look like a grid" do
        result = @tictactoe.draw_grid("Malcome")

        expect(result).to eq("X| | \n | | \n | | ")
    end


    it "gets player 1 to input their name then informs them with what symbol they are playing" do
        
        result = @tictactoe.get_player1_name()


        expect(result).to eq("Betty")
    end

    it "gets player 2 to input their name then informs them with what symbol they are playing" do
        
        result = @tictactoe.get_player2_name()


        expect(result).to eq("Rachael")
    end

    it "gets player 1 to play their first move by stating the row and the column" do
        
        result = @tictactoe.player1_first_move("Betty")

        expect(result).to eq([[" ", " ", "X"], [" "," "," "], [" "," "," "]])
    end
end