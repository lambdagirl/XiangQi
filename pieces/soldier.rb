require_relative './piece.rb'

#兵
class Soldier < Piece

    def name
        "S"
    end

    def deltas 
        [
            [0,1],
            [0,-1],
            [1,0],
        ]
    end

end