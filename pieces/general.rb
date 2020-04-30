require_relative './piece.rb'

#将
class General < Piece
    def name
        "G"
    end
    
    def deltas
        [
            [0,1],
            [1,1],
            [1,0],
            [1,-1],
            [0,-1],
            [-1,-1],
            [-1,0],
            [-1,1]
        ]
    end
end
