# frozen_string_literal: true

require_relative 'board'

board = Board.new

# example travels
start_cell1 = board.find_cell([3, 3])
end_cell1 = board.find_cell([4, 3])
start_cell2 = board.find_cell([3, 3])
end_cell2 = board.find_cell([5, 2])
board.knight_moves(start_cell1, end_cell1) # 3,3 - 4,5 - 2,4 - 4,3
board.knight_moves(start_cell2, end_cell2) # 3,3 - 5,4 - 7,3 - 5,2
