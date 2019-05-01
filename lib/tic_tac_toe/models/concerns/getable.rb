module TicTacToe::IO
  module Getable
    extend TicTacToe::Formattable

    def self.get_input
      gets.chomp
    end

    def self.get_move
      input = self.get_input
      self.format_move(input)
    end
  end
end