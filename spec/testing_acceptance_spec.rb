require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end
   
    context "updates grid" do
      it "puts an X in the top left corner" do
        row = 0
        column = 0
        allow(@tictactoe).to receive(:gets).and_return(row, column)
        result = @tictactoe.update_grid(row, column)
        expect(result).to eq([["X", " ", " "], 
                              [" ", " ", " "], 
                              [" ", " ", " "]])
      end

      it "puts an O in the bottom middle square" do
        @tictactoe.turn+=1
        row = 2
        column = 1
        allow(@tictactoe).to receive(:gets).and_return(row, column)
        
        result = @tictactoe.update_grid(row, column)
        expect(result).to eq([[" ", " ", " "], 
                              [" ", " ", " "], 
                              [" ", "O", " "]])
      end
    end 

    it "prompts the player to choose another square if already taken" do
      grid = @tictactoe.grid = [["X", "O", "X"], ["X", "O", "X"], ["X", "O", "X"]]
      row = 1
      column = 1
      allow(@tictactoe).to receive(:gets).and_return(row, column)
      expect{@tictactoe.update_grid(row, column)}.to output("Choose another square") .to_stdout
    end

  it "Saves players names and gives symbols using their names" do
    @tictactoe.player1 = "Rachel"
    @tictactoe.player2 = "Betty" 
    allow(@tictactoe).to receive(:gets).and_return(@tictactoe.player1, @tictactoe.player2)
    expect{@tictactoe.give_players_symbols()}.to output("#{@tictactoe.player1}, you are X and #{@tictactoe.player2}, you are O") .to_stdout
  end 

  context "Plays the game" do
    context "Gets and saves players names and gives symbols using their names" do 
      it "Prints in the terminal info about symbols using players names" do
          player1 = "Rachel"
          player2 = "Betty"
          allow(@tictactoe).to receive(:gets).and_return(player1, player2)
          expected_output = a_string_including("#{player1}, you are X and #{player2}, you are O")
          expect{@tictactoe.play_game}.to output(expected_output) .to_stdout
      end 
    end

    context "Displays grid" do 
      it "empty grid" do 
        player1 = "Rachel"
        player2 = "Betty"
        allow(@tictactoe).to receive(:gets).and_return(player1, player2)
        expected_output = a_string_including("\n   |   |  \n-----------\n   |   |  \n-----------\n   |   |  \n")
        expect{@tictactoe.play_game}.to output(expected_output) .to_stdout
      end 
    end    
  end
end
