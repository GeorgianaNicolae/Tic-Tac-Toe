require "./tictactoe"

describe TicTacToe do 
    before (:each) do
        @tictactoe = described_class.new
    end
    
    xit 'Plays the game' do
  
      result = @tictactoe.play_game()
  
      expect(result).to eq("Winner")
    end

    # it 'Gets player move' do

    #   row = 1
    #   column = 1

    #   allow(@tictactoe).to receive(:gets).and_return("1", "1")
  
    #   result = @tictactoe.player_move

    #   puts result.inspect, "--------------"
  
    #   expect(result).to eq([row, column])
    #   # this is to demo the comment on line 124 
    #   # expect{output_method()}. to_output('output') .to_stdout
    # end

    xcontext 'updates grid' do
      it 'puts an X in the top left corner' do
        # row = @tictactoe.get_row
        # column = @tictactoe.get_column
        row = allow(@tictactoe).to receive(:gets).and_return("1")
        column = allow(@tictactoe).to receive(:gets).and_return("1")
        puts row.inspect, "--------------"
    
        result = @tictactoe.update_grid(row, column)

        puts result.inspect, "--------------"
    
        expect(result).to eq([["X", " ", " "], 
                              [" ", " ", " "], 
                              [" ", " ", " "]])
        # this is to demo the comment on line 124 
        # expect{output_method()}. to_output('output') .to_stdout
      end
    end
    
end


    