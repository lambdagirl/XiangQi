require_relative 'piece'
require_relative 'stepable'
#仕/士
class Advisor < Piece
    include Stepable

    def name
        "A"
    end

    def deltas 
        [
            [-1,-1],
            [ 1, 1],
            [-1, 1],
            [ 1,-1]
        ]
    end
end
