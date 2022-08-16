# frozen_string_literal: true

require_relative 'display'
require_relative 'cell'

# Class for the chess board
class Board
  include Display

  def initialize
    @board = make_board
    knight_moves
  end

  def make_board
    # make 64 cells for each square on the board, and assign it its coordinates (identifier)
    ary1 = [0, 1, 2, 3, 4, 5, 6, 7]
    ary2 = ary1.clone
    ary = []
    ary1.each do |x|
      ary2.each do |y|
        cell = Cell.new([x, y])
        cell.neighbors.push([x + 2, y + 1]) if in_bounds?(x, y)
        cell.neighbors.push([x + 2, y - 1]) if in_bounds?(x, y)
        cell.neighbors.push([x - 2, y + 1]) if in_bounds?(x, y)
        cell.neighbors.push([x - 2, y - 1]) if in_bounds?(x, y)
        ary.push(cell)
      end
    end
    ary
  end

  def in_bounds?(x, y)
    (x.positive? && x < 7) && (y.positive? && y < 7) ? true : false
  end

  def knight_moves(coord1, coord2, visited = [], path = [])
    # return shortest_path if path[path.length - 1] == coord2

    cell = find_cell(coord1)
    cell.neighbors.each do |neighbor|
      path.push(knight_moves(neighbor, coord2)) unless visited.include?(neighbor)
    end
    visited.push(cell)
  end

  def find_cell(coord)
    # Find a cell by its coordinates and return it
    @board.each do |cell|
      return cell if cell.coord == coord
    end
  end
end
