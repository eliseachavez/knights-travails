# frozen_string_literal: true

require_relative 'display'
require_relative 'cell'

# Class for the chess board
class Board
  include Display

  def initialize
    @board = make_board
    print_board(@board)
  end

  def make_board
    # make 64 cells for each square on the board, and assign it its coordinates (identifier)
    ary1 = [0, 1, 2, 3, 4, 5, 6, 7]
    ary2 = ary1.clone
    ary = []
    ary1.each do |x|
      ary2.each do |y|
        cell = Cell.new([x, y])
        cell.neighbors.push([x + 2, y + 1]) if in_bounds?(x,y)
        cell.neighbors.push([x + 2, y - 1]) if in_bounds?(x,y)
        cell.neighbors.push([x - 2, y + 1]) if in_bounds?(x,y)
        cell.neighbors.push([x - 2, y - 1]) if in_bounds?(x,y)
        ary.push(Cell.new([x, y]))
      end
    end
    ary
  end

  def in_bounds?(x, y)
    (x.positive? && x < 7) && (y.positive? && y < 7) ? true : false
  end
end
