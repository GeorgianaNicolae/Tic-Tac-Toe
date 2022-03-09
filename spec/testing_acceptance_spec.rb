require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end
    
    xit 'Plays the game' do
      result = @tictactoe.play_game()
  
      expect(result).to eq("Winner")
    end

    context 'updates grid' do
      it 'puts an X in the top left corner' do
        allow(@tictactoe).to receive(:gets).and_return("1", "1")
        row = @tictactoe.get_row
        column = @tictactoe.get_column
        result = @tictactoe.update_grid(row, column)
        expect(result).to eq([["X", " ", " "], 
                              [" ", " ", " "], 
                              [" ", " ", " "]])
      end

      it 'puts an O in the bottom middle square' do
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
end

# this is to demo the comment on line 124 
# expect{output_method()}. to_output('output') .to_stdout
