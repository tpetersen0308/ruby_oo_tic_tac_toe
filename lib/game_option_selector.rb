require_relative './game_io.rb'
require_relative './input_validator.rb'
require_relative './messager.rb'

module TicTacToe
  module GameOptionSelector
    class << self
      def select_option(options, 
        game_io = GameIO,
        input_validator = InputValidator, 
        messager = Messager
      )
        selection = game_io.get_input.upcase
        
        unless input_validator.validate_input(selection, options)
          game_io.print_message(messager.get_message(:not_available))
          return select_option(options)
        end
  
        selection
      end
    end
  end
end