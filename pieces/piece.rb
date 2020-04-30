class Piece
    def initialize(color)
        @color = color
    end

    def to_s
        " #{name} "
    end

    def name
        raise UnimplementedError.new
    end

    #possible move
    def deltas
        raise UnimplementedError.new
    end
end 



