require_relative 'piece'
require_relative 'stepable'

#将
class General < Piece
    include Stepable

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
