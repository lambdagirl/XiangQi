require_relative './piece.rb'

#象
class Elephant < Piece

    def name
        "E"
    end
    def deltas 
        [
            [2,2],
            [2,-2],
            [-2,2],
            [-2,-2]
        ]
    end
end
