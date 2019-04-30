module TicTacToe::IO
  module Getable
    include TicTacToe::Formattable

    def get_input
      gets.chomp
    end

    def get_move
      input = get_input
      format_move(input)
    end
  end
end