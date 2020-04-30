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
        raise NotImplementedError.new
    end

    #possible move
    def deltas
        raise NotImplementedError.new
    end

    def within_bound?(pos)
        pos[0].between?(0,9) && pos[1].between?(0,8)
    end
    
end 



