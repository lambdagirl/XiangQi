require_relative './piece.rb'

#车
class Chariots < Piece
    def initialize(color)
        super(color,"R")
    end

    def deltas 
            [
                [1,1]
            ]
    end
end
