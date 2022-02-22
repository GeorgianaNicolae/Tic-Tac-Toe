# Tic-Tac-Toe
Rachel and Georgiana - Ruby TDD

# Day 1 

We were happy to find out that we were paired with each otheter - lots of excitement 

We agreed that we would read the brief and research strategies for winning the game every time. We found a good source on wikiHow

We decided that we will start by just allowing the computer to play first every time for simplicity's sake

Our biggest initial concern was how we will create the grid so we did some research

-- created GitHub repo and invited collaborator
-- cloned repo locally 
-- set up testing environment

## Notes and ideas
    # def play_whole_game()
    #     grid = @tictactoe.create_grid()     
    #     [row, column] = player_move(player)
    #     grid = update_grid(player, grid, row, column)
    #     draw_grid(grid)
    #     check_if_winner()
    #     player2_move
    # end

    Components
    Have an input class, an output class and a main class?
    Have a players class, an updating the grid class and a displaying the grid class?
    Should all components be classes? Modules?

    update_grid
    check if grid element selected is blank
    update_grid is starting to take more factors into coˆnsideration so could be extracted to own component?

    @grid[row-1][column-1] - possible code smell said kyle - look into - when getting the row and column input from user do the -1 bit then

    update file names so they match ruby convention eg tictactoe.rb and tictactoe_spec.rb