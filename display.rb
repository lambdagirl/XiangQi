require "colorize"

class Display

  attr_reader :board, :notifications

  def initialize(board)
    @board = board
    @notifications = {}
  end

  def build_grid
      @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if (i + j).odd?
      bg = :white
    else
      bg = :light_white
    end
    { background: bg }
  end

  def reset!
    @notifications.delete(:error)
  end

  def uncheck!
    @notifications.delete(:check)
  end

  def set_check!
    @notifications[:check] = "Check!"
  end

  def render
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }

    @notifications.each do |_key, val|
      puts val
    end
  end

end
