# frozen_string_literal: true

require_relative 'display'
require_relative 'cell'

# Class for the chess board
class Board
  include Display

  def initialize
    @board = make_board
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

  def knight_moves(coord1, coord2, visited = [], path = [], final_path = [])
    if coord1 == coord2
      path.push(coord1)
      final_path.push(path)
      orig_cell = find_cell(path[0])
      orig_cell.neighbors.each do |neighbor|
        if !visited.include?(neighbor)
          knight_moves(path[0], coord1, visited, [], final_path)
        else
          return visited_func(coord1, coord2, visited, path, final_path)
        end
      end
    end

    cell = find_cell(coord1)
    visited.push(cell.coord)
    path.push(cell.coord)
    cell.neighbors.each do |neighbor|
      knight_moves(neighbor, coord2, visited, path, final_path) unless visited.include?(neighbor)
    end
    path
  end

  def visited_func(x, y, visited, path, final_path)
    puts "made it!"
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


