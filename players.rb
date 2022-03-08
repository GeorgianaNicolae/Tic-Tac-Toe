class Players
    def initialize
        @player1 = ""
        @player2 = ""
        @player1symbol = "X"
        @player2symbol = "O"
    end

    def get_player_names
        puts "Player 1 - enter your name"
        @player1 = gets.chomp
        puts "Player 2 - enter your name"
        @player2 = gets.chomp
    end

    def tell_players_their_symbol
        puts "#{@player1}, you are #{@player1symbol}"
        puts "#{@player2}, you are #{@player2symbol}"
    end
end