module TicTacToe::IO
  module Getable
    def self.get_input
      gets.chomp
    end
  end
end