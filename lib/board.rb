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

  def knight_moves(coord1, coord2, visited = [])
    until visited.size == 64
      puts "hi"
      find_a_path(coord1, coord2)
      # build visited list: count each cell visited (only count the first time)
      @path_options.each do |path|
        path.each { |cell| visited.push(cell) unless visited.include?(cell) }
      end
    end
    # we have visited every cell, now find SHORTEST path
    shortest_path = get_shortest_path
  end

  def shortest_path
    min = Array.new(65, [3,3])
    @path_options.each do |path|
      if path.size < min.size
        min = path
      end
    end
  end

  def find_a_path(coord1, coord2, visited = [])
    visited.push(coord1)

    if coord1 == coord2
      new_path = visited.clone
      @path_options.push(new_path)
    else
      cell = find_cell(coord1)
      cell.neighbors.each do |neighbor|
        find_a_path(neighbor, coord2, visited) unless visited_or_is_an_existing_path?(visited, neighbor)
      end
    end
  end

  def visited_or_is_an_existing_path?(visited, neighbor)
    # check that it isn't in current visited
    visited_with_neighbor_added = visited.clone
    visited_with_neighbor_added.push(neighbor)
    visited.include?(neighbor) || is_an_existing_path?(visited_with_neighbor_added) ? true : false
    # check that it isn't in
  end

  def is_an_existing_path?(visited)
    visited = false
    @path_options.each do |path|
      visited = true if path == visited
    end
    visited
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
