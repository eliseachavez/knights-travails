# frozen_string_literal: true

require_relative 'board'

board = Board.new

# example travels
board.knight_moves([3, 3], [5, 7])

# When the knight hits the end coordinate, stop making calls there
