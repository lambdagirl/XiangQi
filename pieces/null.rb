require_relative './piece.rb'
require 'singleton'

class NullPiece < Piece
  
    attr_reader :name
    include Singleton
  
    def initialize
      @name = " "
      @color = :none
    end
  
    def empty?
      true
    end
  
    def deltas
      []
    end
  
  end
  
