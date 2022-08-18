# frozen_string_literal: true

require_relative 'display'
require_relative 'cell'

# Class for the chess board
class Board
  include Display

  def initialize
    @board = make_board
    @size = 64
    @path_options = []
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

  def find_a_path(coord1, coord2, visited = [])
    visited.push(coord1)

    if coord1 == coord2
      new_path = visited.clone
      @path_options.push(new_path)
    else
      cell = find_cell(coord1)
      cell.neighbors.each do |neighbor|
        find_a_path(neighbor, coord2, visited) unless visited_or_in_existing_path?(visited, neighbor)
      end
    end
  end

  def visited_or_in_existing_path?(visited, neighbor)
    # check that it isn't in current visited
    visited.include?(neighbor) || @path_options.any? { |path| path.include?(neighbor) } ? true : false
    # check that it isn't in
  end

  def all_nodes_visited?(visited)
    visited.size == @board.size ? true : false
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
