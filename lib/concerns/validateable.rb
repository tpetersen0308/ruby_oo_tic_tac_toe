module TicTacToe
  module Validateable
    class << self
      def validate_input(input, valid_options)
        valid_options.include?(input)
      end
    end
  end
end