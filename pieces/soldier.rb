require_relative 'piece'
require_relative 'stepable'
#兵
class Soldier < Piece
    include Stepable

    def name
        "S".colorize(color)
    end

    def deltas 
        if crossed_rever? 
            color == :red ? [[0,1],[0,-1],[1,0]] : [[0,1],[0,-1],[-1,0]]
        else
            color == :red ? [[1,0]] : [[-1,0]]
        end
    end

    def crossed_rever?
        color == :red ? pos[0] > 4 : pos[0] < 5
    end

end