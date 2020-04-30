require_relative './piece.rb'

#车
class Chariots < Piece
    def name
        "R"
    end

    def deltas 
            [
                [1,1]
            ]
    end
end
