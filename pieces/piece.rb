class Piece
    attr_reader :board, :color
    attr_accessor :pos
        def initialize(color, board, pos)
        @color = color
        @board = board
        @pos   = pos
        board[pos] = self
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



