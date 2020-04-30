require_relative 'piece'
require "colorize"

#车
class Chariots < Piece
    def name
        "R".colorize(color)
    end

    def deltas 
        [[-1, 0],
        [0, -1],
        [0, 1],
        [1, 0]]
    end

    def moves
        moves = []
        deltas.each do |dx, dy|
          moves.concat(grow_unblocked_moves_in_dir(dx, dy))
        end
        moves
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        cur_x, cur_y = pos
        moves = []
        loop do
          cur_x, cur_y = cur_x + dx, cur_y + dy
          pos = [cur_x, cur_y]
    
          break unless self.within_bound?
    
          if board.empty?(pos)
            moves << pos
          else
            # can take an opponent's piece
            moves << pos if board[pos].color != color
    
            # can't move past blocking piece
            break
          end
        end
        moves
      end
end
