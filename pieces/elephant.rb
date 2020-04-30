require_relative './piece.rb'

#象
class Elephant < Piece

    def initialize(color)
        super(color,"E")
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
