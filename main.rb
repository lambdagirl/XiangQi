require_relative './board.rb'

def main
    b = Board.new
    b.print
    b.move_piece(:red,[0,4],[1,4])
    # # b.move_piece(:red,[3,0],[3,2])
    # b.move_piece(:red,[0,0],[1,0])
    # b.move_piece(:red,[1,0],[4,0])

    b.print
    require 'pry'; binding.pry
end

main