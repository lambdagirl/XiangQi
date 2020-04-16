require_relative './horse.rb'
class Board
    ROW = 10
    COL = 8

    def initialize
        @grid = Array.new(ROW) { Array.new(COL, nil) }
        set_initial_state
    end

    def [](row,col)
        @grid[row][col]
    end

    def set_initial_state
        place_piece(Horse.new(:black),0,1)
        place_piece(Horse.new(:black),0,6)
        place_piece(Horse.new(:red),  9,1)
        place_piece(Horse.new(:red),  9,6)
    end

    def print
        @grid.each do |row|
            cells = []
            row.each do |piece|
                if piece == nil
                    cells << "-"
                else 
                    cells << piece.to_s
                end
            end
            puts cells.join(' ')
        end        
    end

    private
        def place_piece(piece,row,col)
            @grid[row][col] = piece            
        end
    

end
