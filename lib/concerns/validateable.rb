module TicTacToe
  module Validateable
    def self.validate_input(input, valid_options)
      valid_options.include?(input)
    end
  end
end