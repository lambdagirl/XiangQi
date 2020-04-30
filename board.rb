require_relative 'all'



class Board
    ROW = 10
    COL = 9

    attr_reader :sentinel
    def initialize
        @sentinel = NullPiece.instance
        @grid = Array.new(ROW) { Array.new(COL, @sentinel) }

        set_initial_state
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end
    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val  
    end

    def set_initial_state
        place_piece(Chariots.new(:red),0,0)
        place_piece(Chariots.new(:red),0,8)
        place_piece(Chariots.new(:black),9,8)
        place_piece(Chariots.new(:black),9,0)

        place_piece(Horse.new(:red),0,1)
        place_piece(Horse.new(:red),0,7)
        place_piece(Horse.new(:black),9,1)
        place_piece(Horse.new(:black),9,7)

        place_piece(Elephant.new(:red),0,2)
        place_piece(Elephant.new(:red),0,6)
        place_piece(Elephant.new(:black),9,2)
        place_piece(Elephant.new(:black),9,6)

        place_piece(Advisor.new(:red),0,3)
        place_piece(Advisor.new(:red),0,5)
        place_piece(Advisor.new(:black),9,2)
        place_piece(Advisor.new(:black),9,5)


        place_piece(Cannon.new(:red),2,1)
        place_piece(Cannon.new(:red),2,7)
        place_piece(Cannon.new(:black),7,1)
        place_piece(Cannon.new(:black),7,7)

        place_piece(Soldier.new(:red),3,0)
        place_piece(Soldier.new(:red),3,2)
        place_piece(Soldier.new(:red),3,4)
        place_piece(Soldier.new(:red),3,6)
        place_piece(Soldier.new(:red),3,8)
        place_piece(Soldier.new(:black),6,0)
        place_piece(Soldier.new(:black),6,2)
        place_piece(Soldier.new(:black),6,4)
        place_piece(Soldier.new(:black),6,6)
        place_piece(Soldier.new(:black),6,8)


        place_piece(General.new(:red),0,4)
        place_piece(General.new(:black),9,4)
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

    def possible_move_for(pos_arr)
        row,col = pos_arr
        piece = @grid[row][col]
        if piece == nil 
            raise Error
        end
        next_possible  = []
        piece.deltas.each do |d|
            r = row + d[0]
            c = col + d[1]
            if within_bound?(r, c)
                next_possible << [r,c]
            end
        end
    end

    def within_bound?(row,col)
        return false if row < 0 || row >>ROW
        return false if col < 0 || col >>ROW
        true
    end

    def move_piece!(start_pos, end_pos)
        piece = self[start_pos]
        self[end_pos] = piece
        self[start_pos] = nil
        nil
    end

    private
        def place_piece(piece,row,col)
            @grid[row][col] = piece            
        end
end
