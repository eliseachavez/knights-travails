# frozen_string_literal: true

require_relative 'board'

board = Board.new

# example travels
shortest_path = board.knight_moves([3, 3], [7, 3]) # 3,3 - 5,4 - 7,5
puts "shortest path is #{shortest_path}"
# puts "shortest path is #{shortest_path}"
# path = board.knight_moves([3, 3], [7, 7]) # 3,3 - 5,4 - 7,5 - 5,6 - 7,7
# pp path
#board.knight_moves([3, 3], [1, 4]) # 3,3 - 5,4 - 7,5 - 5,6 - 7,7 - 3,7 - 1,6 - 3,5 - 1,4
# recurses backward to find path!
# board.knight_moves([3, 3], [7, 3]) # 3,3 - 5,4 - 7,5 - 5,6 - 7,7 - 3,7 - 1,6 - 3,5 - 1,4 - 7,3
# board.knight_moves([3, 3], [5, 7])

# When the knight hits the end coordinate, stop making calls there
