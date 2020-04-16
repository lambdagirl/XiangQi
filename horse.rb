require_relative './piece.rb'

class Horse < Piece
    def initialize(color)
        super(color, "H")
    end

    def deltas 
        [
            [1,2],
            [2,1],
            [2,-1],
            [1,-2]
        ]
    end

end