require_relative 'piece'
require_relative 'stepable'
#马 
class Horse < Piece


    def name
        "H".colorize(color)
    end

    def deltas 
        [
            [1,2],
            [1,-2],
            [-1,2],
            [-1,-2],
            [2,1],
            [2,-1],
            [-2,1],
            [-2,-1]
        ]
    end

    def blocks
        
        [[0,1],[0,-1],[1,0],[-1,0]]
        
    end

    def moves
        #蹩马腿

        blocked = []
        blocks.each_with_object([]) do |(dx, dy), moves|
            cur_x, cur_y = pos
            pos = [cur_x + dx, cur_y + dy]
            next unless self.within_bound?(pos)
            if !board.empty?(pos)
                if dx == 0 and dy == 1
                    deltas.each { |d| blocked << d if d[1]> 1 }
                elsif dx == 0 and dy == -1
                    deltas.each { |d| blocked << d if d[1]< -1  }
                elsif dx == 1 and dy == 0
                    deltas.each { |d| blocked << d if d[0]> 1   }
                elsif dx == -1 and dy == 0
                    deltas.each { |d| blocked << d if  d[0]< -1 }
                end
                p pos, blocked
            end
        end

        deltas.each_with_object([]) do |(dx, dy), moves|
          cur_x, cur_y = pos
          pos = [cur_x + dx, cur_y + dy]
    
          next unless self.within_bound?(pos) && !blocked.include?([dx, dy])
          if board.empty?(pos)
            moves << pos
          elsif board[pos].color != color
            moves << pos
          end
        end
      end


end