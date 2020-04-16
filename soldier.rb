require_relative './piece.rb'

#兵
class Soldier < Piece

    def initialize(color)
        super(color, "S")
    end

    def deltas 
        [
            [0,1],
            [0,-1],
            [1,0],
        ]
    end

end