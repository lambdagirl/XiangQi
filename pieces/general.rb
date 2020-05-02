require_relative 'piece'
require_relative 'stepable'

#将
class General < Piece
    include Stepable

    def name
        color == :red ? "帥".colorize(color) : "將".colorize(color)
    end
    
    def deltas
        [
            [0,1],
            [1,1],
            [1,0],
            [1,-1],
            [0,-1],
            [-1,-1],
            [-1,0],
            [-1,1]
        ]
    end

    def within_bound?(pos)
        if color == :red
            pos[0].between?(0,2) && pos[1].between?(3,5)
        else
            pos[0].between?(7,9) && pos[1].between?(3,5)
        end
    end
end
