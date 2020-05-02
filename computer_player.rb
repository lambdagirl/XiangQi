require_relative 'display'
require_relative 'player'

class ComputerPlayer < Player
  def make_move(board)
      @display.render
      moves = board.possible_moves(color)
      start_pos = moves.keys.sample
      end_pos = moves[start_pos].sample
      
      [start_pos, end_pos]
    end
end
