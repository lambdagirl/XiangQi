require_relative './piece.rb'

#仕/士
class Advisor < Piece
    def initialize(color)
        super(color,"A")
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
