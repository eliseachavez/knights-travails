# frozen_string_literal: true

# Module for displaying to the terminal
module Display
  @white_chess_pieces =
    {
      king: "\u2654",
      queen: "\u2655",
      rook: "\u2656",
      bishop: "\u2657",
      knight: "\u2658",
      pawn: "\u2659",
      circle: "\u25EF"
    }

  @black_chess_pieces =
    {
      king: "\u265A",
      queen: "\u265B",
      rook: "\u265C",
      bishop: "\u265D",
      knight: "\u265F",
      pawn: "\u265E",
      circle: "\u25EF"
    }

  def black_bg; "\e[40m #{self} \e[0m "end
  def white_bg; p "\e[47m #{self} \e[0m" end

  def print_board(board)
    flipflop = true
    count = 0
    board.each do
      if count == 10
        puts nil
        count = 0
      end
      flipflop ? "".white_bg : "".black_bg
      flipflop = !flipflop
      count += 1
    end
  end
end
