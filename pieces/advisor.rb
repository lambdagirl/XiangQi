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
        pos[0].between?(0,2) && pos[1].between?(3,5)
    end
end
