require_relative './piece.rb'

#炮
class Cannon < Piece
    def initialize(color)
        super(color,"C")
    end

    def deltas 
        [
        [1,1]
        ]
    end
end
