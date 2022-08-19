# frozen_string_literal: true

require_relative 'display'
require_relative 'cell'

# Class for the chess board
class Board
  include Display

  def initialize
    @board = make_board
    @size = 64
    @path_options = [[]]
  end

  def make_board
    # make 64 cells for each square on the board, and assign it its coordinates (identifier)
    ary1 = [0, 1, 2, 3, 4, 5, 6, 7]
    ary2 = ary1.clone
    ary = []
    ary1.each do |x|
      ary2.each do |y|
        cell = Cell.new([x, y])
        cell.neighbors.push([x + 2, y + 1]) if in_bounds?(x + 2, y + 1)
        cell.neighbors.push([x + 2, y - 1]) if in_bounds?(x + 2, y - 1)
        cell.neighbors.push([x - 2, y + 1]) if in_bounds?(x - 2, y + 1)
        cell.neighbors.push([x - 2, y - 1]) if in_bounds?(x - 2, y - 1)
        ary.push(cell)
      end
    end
    ary
  end

  def in_bounds?(x, y)
    (x > -1 && x < 8) && (y > -1 && y < 8) ? true : false
  end

  def knight_moves(coord1, coord2, visited = [], queue = [coord1])
    # YOU DON"T GO TO ANOTHER LEVEL UNTIL YOU HAVE VISITED ALL NEIGHBORS
    pp coord1
    cell = find_cell(coord1)
    visited.push(coord1)
    return if coord1 == coord2

    until queue.empty?
      # remove current node and insert all neighbors to queue now
      queue.shift
      cell.neighbors.each do |neighbor|
        queue.push(neighbor) unless in_visited_or_queue?(neighbor, queue, visited)
      end
      knight_moves(queue.first, coord2, visited, queue)
    end
  end

  def in_visited_or_queue?(coord, queue, visited)
    visited.include?(coord) || queue.include?(coord) ? true : false
  end

  def find_cell(coord)
    # Find a cell by its coordinates and return it
    node = nil
    @board.each do |cell|
      node = cell if cell.coord == coord
    end
    node
  end
end
