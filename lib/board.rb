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
    if visited.size < 64
      find_a_path(coord1, coord2)
      # build visited list: count each cell visited (only count the first time)
      @path_options.each do |path|
        path.each { |cell| visited.push(cell) unless visited.include?(cell) }
      end
    end
    # we have visited every cell, now find SHORTEST path
    shortest_path = get_shortest_path
  end

  def get_shortest_path
    min = Array.new(65, [3,3])
    @path_options.each do |path|
      if path.size < min.size
        min = path
      end
    end
  end

  def find_a_path(coord1, coord2, visited = [])
    # how do I exit after I've found the LAST path? because it will always keep looking for the next one
    # check that all possible paths haven't already been found:
    total_visited = []
    @path_options.each do |path|
      path.each { |cell| total_visited.push(cell) unless total_visited.include?(cell) }
    end

    #if total_visited.size < 64

    visited.push(coord1)

    if coord1 == coord2
      new_path = visited.clone
      @path_options.push(new_path)
    else
      cell = find_cell(coord1)
      begin
        cell.neighbors.each do |neighbor|
          unless visited.include?(neighbor)
            unless is_an_existing_path?(visited, neighbor)
              find_a_path(neighbor, coord2, visited)
            end
          end
        end
      rescue StandarError => e
        puts "In the rescue block, exception is #{e}"
      end
    end
  end

  def is_an_existing_path?(visited, neighbor)
    visited_with_neighbor_added = visited.clone
    visited_with_neighbor_added.push(neighbor)

    visited = false
    @path_options.each do |path|
      visited = true if path == visited_with_neighbor_added
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
