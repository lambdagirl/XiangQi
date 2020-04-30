require_relative './board.rb'

def main
    b = Board.new
    b.print
    b.move_piece(:red,[0,4],[1,4])
    
    b.print
    require 'pry'; binding.pry
end

main