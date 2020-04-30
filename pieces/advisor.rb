require_relative './piece.rb'

#仕/士
class Advisor < Piece
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
