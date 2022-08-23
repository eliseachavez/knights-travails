# frozen_string_literal: true

require_relative 'board'

board = Board.new

# example travels
shortest_path = board.knight_moves([3, 3], [7, 5]) # 3,3 - 5,4 - 7,5
puts "The shortest path from [3, 3] to [7, 5] is #{shortest_path}"
puts "                              ***"

shortest_path = board.knight_moves([3, 3], [7, 7])
puts "The shortest path from [3, 3] to [7, 7] is #{shortest_path}"
puts "                              ***"

shortest_path = board.knight_moves([3, 3], [1, 4])
puts "The shortest path from [3, 3] to [1, 4] is #{shortest_path}"
puts "                              ***"

shortest_path = board.knight_moves([3, 3], [7, 3])
puts "The shortest path from [3, 3] to [7, 3] is #{shortest_path}"
puts "                              ***"

shortest_path = board.knight_moves([3, 3], [5, 7])
puts "The shortest path from [3, 3] to [5, 7] is #{shortest_path}"
puts "                              ***"
