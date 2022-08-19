# frozen_string_literal: true

require_relative 'board'

board = Board.new

start_coord = [3, 3]
end_coord = [7, 3]
shortest_path = board.knight_moves(start_coord, end_coord) # 3,3 - 5,4 - 7,3
puts "shortest path for #{start_coord} and #{end_coord} is #{shortest_path}"

start_coord = [3, 3]
end_coord = [7, 7]
shortest_path = board.knight_moves(start_coord, end_coord) # 3,3 - 5,4 - 7,5 - 5,6 - 7,7
puts "shortest path for #{start_coord} and #{end_coord} is #{shortest_path}"

start_coord = [3, 3]
end_coord = [1, 4]
shortest_path = board.knight_moves(start_coord, end_coord) # 3,3 - 1,4
puts "shortest path for #{start_coord} and #{end_coord} is #{shortest_path}"

start_coord = [0, 0]
end_coord = [2, 1]
shortest_path = board.knight_moves(start_coord, end_coord) # 3,3 - 1,4
puts "shortest path for #{start_coord} and #{end_coord} is #{shortest_path}"

start_coord = [0, 0]
end_coord = [1, 2]
shortest_path = board.knight_moves(start_coord, end_coord) # 3,3 - 1,4
puts "shortest path for #{start_coord} and #{end_coord} is #{shortest_path}"

start_coord = [0, 0]
end_coord = [3, 3]
shortest_path = board.knight_moves(start_coord, end_coord) # 3,3 - 1,4
puts "shortest path for #{start_coord} and #{end_coord} is #{shortest_path}"

start_coord = [3, 3]
end_coord = [0, 0]
shortest_path = board.knight_moves(start_coord, end_coord) # 3,3 - 1,4
puts "shortest path for #{start_coord} and #{end_coord} is #{shortest_path}"

start_coord = [3, 3]
end_coord = [4, 3]
shortest_path = board.knight_moves(start_coord, end_coord) # 3,3 - 1,4
puts "shortest path for #{start_coord} and #{end_coord} is #{shortest_path}"

start_coord = [3, 3]
end_coord = [5, 7]
shortest_path = board.knight_moves(start_coord, end_coord)
puts "shortest path for #{start_coord} and #{end_coord} is #{shortest_path}"
