require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end
   
    context "updates grid" do
      it "puts an X in the top left corner" do
        allow(@tictactoe).to receive(:gets).and_return("1", "1")
        row = @tictactoe.get_row
        column = @tictactoe.get_column
        result = @tictactoe.update_grid(row, column)
        expect(result).to eq([["X", " ", " "], 
                              [" ", " ", " "], 
                              [" ", " ", " "]])
      end

      it "puts an O in the bottom middle square" do
        @tictactoe.turn+=1
        allow(@tictactoe).to receive(:gets).and_return("3", "2")
        row = @tictactoe.get_row
        column = @tictactoe.get_column
        result = @tictactoe.update_grid(row, column)
        expect(result).to eq([[" ", " ", " "], 
                              [" ", " ", " "], 
                              [" ", "O", " "]])
      end
    end 

    it "prompts the player to choose another square if already taken" do
      grid = @tictactoe.grid = [["X", "O", "X"], ["X", "O", "X"], ["X", "O", "X"]]
      allow(@tictactoe).to receive(:gets).and_return("1", "1")
      row = @tictactoe.get_row
      column = @tictactoe.get_column
      expect{@tictactoe.update_grid(row, column)}.to output("Choose another square") .to_stdout
    end

  it "Saves players names and gives symbols using their names" do
    allow(@tictactoe).to receive(:gets).and_return("Rachel", "Betty")
    player1 = @tictactoe.get_player1_name
    player2 = @tictactoe.get_player2_name 
    expect{@tictactoe.give_players_symbols()}.to output("#{player1}, you are X and #{player2}, you are O") .to_stdout
  end 

  context "Plays the game" do
    context "Gets and saves players names and gives symbols using their names"
      it "Gets player 1 name" do

        allow(@tictactoe).to receive(:gets).and_return("Max")
        @tictactoe.play_game
        expect(@tictactoe.player1).to eq("Max")
      end

      it "Gets player 2 name" do

        allow(@tictactoe).to receive(:gets).and_return("Lulu")
        @tictactoe.play_game
        expect(@tictactoe.player2).to eq("Lulu")
      end 

      it "Prints in the terminal info about symbols using players names" do
          player1 = "Rachel"
          player2 = "Betty"
          allow(@tictactoe).to receive(:gets).and_return(player1, player2)
          expected_output = a_string_including("#{player1}, you are X and #{player2}, you are O")

          expect{@tictactoe.play_game()}.to output(expected_output) .to_stdout
      end 
  end
end
