require_relative 'piece'
require_relative 'stepable'
#象
class Elephant < Piece
    include Stepable

    def name
        color == :red ? "相".colorize(color) : "象".colorize(color)
    end
    
    def deltas 
        [
            [2,2],
            [2,-2],
            [-2,2],
            [-2,-2]
        ]
    end
    def within_bound?(pos)
        if color == :red
            pos[0].between?(0,4) && pos[1].between?(0,8)
        else
            pos[0].between?(5,9) && pos[1].between?(0,8)
        end
    end
end
