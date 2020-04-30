require_relative 'piece'
require_relative 'stepable'
#马
class Horse < Piece
    include Stepable

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