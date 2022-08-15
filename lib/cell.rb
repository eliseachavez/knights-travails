# frozen_string_literal: true

# Class that represents the square on a chess board
class Cell
  attr_accessor :coord, :neighbors

  def initialize(coord, neighbors = [])
    @coord = coord
    @neighbors = neighbors
  end
end
