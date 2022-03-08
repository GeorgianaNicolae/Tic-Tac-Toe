require './grid'

class Display
    def draw_grid
        puts "\n"
        puts " #{grid[0][0]} | #{grid[0][1]} | #{grid[0][2]}"
        puts "-----------"
        puts " #{grid[1][0]} | #{grid[1][1]} | #{grid[1][2]}"
        puts "-----------"
        puts " #{grid[2][0]} | #{grid[2][1]} | #{grid[2][2]}"
    end
end