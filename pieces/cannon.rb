require_relative './piece.rb'

#炮
class Cannon < Piece
    def name
      color == :red ? "炮".colorize(color) : "砲".colorize(color)
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
          moves.concat(grow_blocked_moves_in_dir(dx, dy))
        end
    
        moves
      end

    def grow_blocked_moves_in_dir(dx,dy)
        cur_x,cur_y = pos
        moves = []
        stone = 0

        loop do 

          cur_x, cur_y = cur_x + dx, cur_y + dy
          pos = [cur_x,cur_y]

          break unless self.within_bound?(pos)

            if board.empty?(pos) && stone == 0
              moves << pos
              
            elsif !board.empty?(pos)
                stone += 1
            #炮翻山 can move past of 1 stone in between piece 
                if stone == 2 && board[pos].color != color
                    moves << pos
                    break
                end            
            end
        end
         moves

      end
end
