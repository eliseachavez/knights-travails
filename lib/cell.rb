# frozen_string_literal: true

class Cell
  def initialize(coord, neighbors = nil)
    @coord = coord
    @neighbors = neighbors
  end
end
