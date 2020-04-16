class Piece
    def initialize(color, name)
        @color = color
        @name  = name
    end

    def to_s
        '#{color} #{name}'
    end

    #possible move
    def deltas
        raise UnimplementedError.new
    end
end 



