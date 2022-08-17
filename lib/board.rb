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


  def knight_moves(coord, end_coord, visited = [], queue = [[coord]])
    visited.push(coord)
    if coord == end_coord
      # Look through our list. Is there another list that has an end coordinate?
      puts "hi"
      print_path(queue)
    else
      #   1. Look in queue for an array in the queue that ends with the current ("parent" cell)
      cell = find_cell(coord)
      queue.each_with_index do |queue_path, index|
        if queue_path.last == coord
          #   2. For each neighbor ("child") that current cell has that hasn't been visited:
          # create a new array and push the current cell and all its neighbors to it
          cell.neighbors.each_with_index do |neighbor, neighbor_idx|
            if !visited.include?(neighbor)
              child_q = queue[index].clone
              child_q.push(neighbor)
              queue.push(child_q)
              if neighbor_idx == 3
                #   3. Iterate through each neighbor now, making a recursive call with a queue
                # that now has a new array for each neighbor fused with the path of its parent
                cell.neighbors.each do |cell_neighbor|
                  knight_moves(cell_neighbor, end_coord, visited, queue) unless visited.include?(cell_neighbor)
                end
              end
            end
          end
        end
      end
    end
    puts "hi"
    pp "#{queue}"
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


