require_relative 'piece'
require_relative 'stepable'
#仕/士
class Advisor < Piece
    include Stepable

    def name
        "A".colorize(color)
    end

    def deltas 
        [
            [-1,-1],
            [ 1, 1],
            [-1, 1],
            [ 1,-1]
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
