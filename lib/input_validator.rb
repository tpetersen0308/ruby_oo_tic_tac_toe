module TicTacToe
  module InputValidator
    class << self
      def validate_input(input, valid_options)
        valid_options.include?(input)
      end
    end
  end
end