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
        Chariots.new(:red, self, [0,0])
        Chariots.new(:red, self, [0,8])
        Chariots.new(:black, self, [9,8])
        Chariots.new(:black, self, [9,0])

        Horse.new(:red, self, [0,1])
        Horse.new(:red, self, [0,7])
        Horse.new(:black, self, [9,1])
        Horse.new(:black, self, [9,7])



        Elephant.new(:red, self, [0,2])
        Elephant.new(:red, self, [0,6])
        Elephant.new(:black, self, [9,2])
        Elephant.new(:black, self, [9,6])


        Advisor.new(:red, self, [0,3])
        Advisor.new(:red, self, [0,5])
        Advisor.new(:black, self, [9,3])
        Advisor.new(:black, self, [9,5])


        Cannon.new(:red, self, [2,1])
        Cannon.new(:red, self, [2,7])
        Cannon.new(:black, self, [7,1])
        Cannon.new(:black, self, [7,7])

        Soldier.new(:red, self, [3,0])
        Soldier.new(:red, self, [3,2])
        Soldier.new(:red, self, [3,4])
        Soldier.new(:red, self, [3,6])
        Soldier.new(:red, self, [3,8])
        Soldier.new(:black, self, [6,0])
        Soldier.new(:black, self, [6,2])
        Soldier.new(:black, self, [6,4])
        Soldier.new(:black, self, [6,6])
        Soldier.new(:black, self, [6,8])

        Soldier.new(:red, self, [0,4])
        Soldier.new(:black, self, [9,4])


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
