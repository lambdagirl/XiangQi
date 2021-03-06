require_relative 'all'
require "colorize"

class Board
    ROW = 10
    COL = 9

    attr_reader :sentinel , :grid
    def initialize
        @sentinel = NullPiece.instance
        @grid = Array.new(ROW) { Array.new(COL, @sentinel) }
        set_initial_state
    end

    def [](pos)
        raise 'invalid pos' unless valid_pos?(pos)
    
        row, col = pos
        @grid[row][col]
      end
    
      def []=(pos, piece)
        raise 'invalid pos' unless valid_pos?(pos)
    
        row, col = pos
        @grid[row][col] = piece
      end
      
    def valid_pos?(pos)
        pos[0].between?(0,ROW-1) && pos[1].between?(0,COL-1)
    end

    def possible_moves(color)
        moves = {}
        pieces.each do |piece|
            if piece.color == color
                moves[piece.pos] = piece.valid_moves
            end
        end
        moves
    end
 
    def empty?(pos)
        self[pos] == sentinel
      end

    def move_piece(turn_color, start_pos, end_pos)
        raise 'start position is empty' if empty?(start_pos)
    
        piece = self[start_pos]
        if piece.color != turn_color
          raise 'You must move your own piece'
        elsif !piece.moves.include?(end_pos)
          raise 'Piece does not move like that'
        end
    
        move_piece!(start_pos, end_pos)
      end

    def move_piece!(start_pos, end_pos)
        piece = self[start_pos]
        self[end_pos] = piece
        self[start_pos] = sentinel
        piece.pos = end_pos

        nil
    end



    def set_initial_state
        Chariots.new(:red, self, [0,0])
        Chariots.new(:red, self, [0,8])
        Chariots.new(:black, self, [9,8])
        Chariots.new(:black, self, [9,0])

        Horse.new(:red, self, [0,1])
        Horse.new(:red, self, [0,7])
        Horse.new(:black, self, [9,1])
        Horse.new(:black, self, [9,7])

        Elephant.new(:red, self, [0,2])
        Elephant.new(:red, self, [0,6])
        Elephant.new(:black, self, [9,2])
        Elephant.new(:black, self, [9,6])

        Advisor.new(:red, self, [0,3])
        Advisor.new(:red, self, [0,5])
        Advisor.new(:black, self, [9,3])
        Advisor.new(:black, self, [9,5])

        Cannon.new(:red, self, [2,1])
        Cannon.new(:red, self, [2,7])
        Cannon.new(:black, self, [7,1])
        Cannon.new(:black, self, [7,7])

        Soldier.new(:red, self, [3,0])
        Soldier.new(:red, self, [3,2])
        Soldier.new(:red, self, [3,4])
        Soldier.new(:red, self, [3,6])
        Soldier.new(:red, self, [3,8])
        Soldier.new(:black, self, [6,0])
        Soldier.new(:black, self, [6,2])
        Soldier.new(:black, self, [6,4])
        Soldier.new(:black, self, [6,6])
        Soldier.new(:black, self, [6,8])

        General.new(:red, self, [0,4])
        General.new(:black, self, [9,4])
    end


    def dup
        new_board = Board.new

        pieces.each do |piece|
            piece.class.new(piece.color, new_board, piece.pos)
        end
    
        new_board
    end

    def in_check?(color)
        king_pos = find_king(color).pos
        pieces.any? do |p|
            p.color != color && p.moves.include?(king_pos)
          end
    end
    

    def checkmate?(color)
        return false unless in_check?(color)
    
        pieces.select { |p| p.color == color }.all? do |piece|
          piece.valid_moves.empty?
        end
    end
    
    def pieces
        pieces = []
        @grid.each do |row|
            row.each do |piece|
                if piece != sentinel
                    pieces << piece
                end
            end
        end    
        pieces
    end      
      
    def find_king(color)
        king_pos = pieces.find { |p| p.color == color && p.is_a?(General) }
        king_pos || (raise "#{color} lost, game over!")
    end



end
