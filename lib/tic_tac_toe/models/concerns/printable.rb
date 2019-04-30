module TicTacToe::IO
  module Printable
    include TicTacToe::Formattable

    def print_message(msg)
      puts(msg)
    end
    
    def print_board(cells)
      formatted_board = format_board(cells)
      puts(formatted_board)
    end
  end
end