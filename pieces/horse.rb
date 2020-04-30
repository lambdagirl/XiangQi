require_relative './piece.rb'

#马
class Horse < Piece
    def name
        "H"
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