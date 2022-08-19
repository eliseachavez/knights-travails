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

  def knight_moves(coord1, coord2, visited = [], queue = [coord1], shortest_path = nil)
    # YOU DON"T GO TO ANOTHER LEVEL UNTIL YOU HAVE VISITED ALL NEIGHBORS
    return if !shortest_path.nil?

    cell = find_cell(coord1)
    visited.push(coord1)

    @path_options.push([coord1]) if @path_options.size == 1

    until coord1 == coord2  || !shortest_path.nil?
      # remove current node and insert all neighbors to queue now
      parent = queue.shift
      # find path with parent as last node
      parent_path = find_existing_path_with_parent_as_last_node(parent)

      cell.neighbors.each do |neighbor|
        child_path = parent_path.clone
        queue.push(neighbor) unless in_visited_or_queue?(neighbor, queue, visited)
        child_path.push(neighbor) # connect parent to child
        @path_options.push(child_path)
        # find path that ends in parent
      end
      shortest_path = knight_moves(queue.first, coord2, visited, queue, shortest_path)
    end
    find_shortest_path(coord2)
  end

  def find_shortest_path(coord2)
    paths = create_list_of_paths_with_end_coord(coord2)
    shortest_path = paths[0]
    paths.each do |path|
      shortest_path = path if path.size < shortest_path.size
    end
    shortest_path
  end

  def create_list_of_paths_with_end_coord(coord2)
    @path_options.select do |path|
      path.last == coord2
    end
  end

  def find_existing_path_with_parent_as_last_node(parent)
    parent_path = nil
    @path_options.each do |path|
      parent_path = path if path.last == parent
    end
    parent_path
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
