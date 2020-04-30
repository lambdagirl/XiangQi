require_relative 'piece'
require_relative 'stepable'
#象
class Elephant < Piece
    include Stepable

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
