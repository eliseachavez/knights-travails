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

  def knight_moves
    #   1. Look in queue for an array in the queue that ends with the current ("parent" cell)
    #   2. For each neighbor ("child") that current cell has that hasn't been visited:
    # create a new array and push the current cell and all its neighbors to it
    #   3. Iterate through each neighbor now, making a recursive call with a queue
    # that now has a new array for each neighbor fused with the path of its parent
  end

  # def knight_moves(coord1, coord2, visited = [], queue = [])
  #   # by doing level order recursion, we can choose at the level where we find coord1 first and therefore the shortest path
  #   if coord1 == coord2
  #     puts "filler"
  #   end

  #   cell = find_cell(coord1)
  #   visited.push(cell)
  #   queue.push([coord1])

  #   if queue.last.size < 5 # stop recursively calling
  #     cell.neighbors.each_with_index do |neighbor, index|
  #       visited.push(neighbor)
  #       queue.each_with_index do |path, index|
  #         if path.last == coord1
  #           # insert at index the neighbor
  #           queue[index].push(neighbor) unless visited.include?(neighbor)
  #         end
  #       end
  #     end
  #   end
  #   queue.clear
  #   cell.neighbors.each do |neighbor|
  #     knight_moves(neighbor, coord2, visited, queue) unless visited.include?(neighbor)
  #   end
  # end

  def find_cell(coord)
    # Find a cell by its coordinates and return it
    node = nil
    @board.each do |cell|
      node = cell if cell.coord == coord
    end
    node
  end
end


