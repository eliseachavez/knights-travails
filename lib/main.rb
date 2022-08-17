# frozen_string_literal: true

require_relative 'board'

board = Board.new

# example travels
# board.knight_moves([3, 3], [4, 3]) # 3,3 - 4,5 - 2,4 - 4,3
board.knight_moves([3, 3], [5, 2]) # 3,3 - 5,4 - 7,3 - 5,2
