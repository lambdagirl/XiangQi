require_relative 'piece'
require_relative 'stepable'
#兵
class Soldier < Piece
    include Stepable

    def name
        "S".colorize(color)
    end

    def deltas 
        [
            [0,1],
            [0,-1],
            [1,0],
        ]
    end

end