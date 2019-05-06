module TicTacToe
  module GameOptionSelector
    class << self
      def select_option(prompt, options, 
        output = CONFIG.fetch(:output), 
        input = CONFIG.fetch(:input), 
        validator = CONFIG.fetch(:validator), 
        messager = CONFIG.fetch(:messager)
      )
  
        output.print_message(prompt)
        selection = input.get_input.upcase
        
        unless validator.validate_input(selection, options)
          output.print_message(messager.message(:not_available))
          return select_option(prompt, options)
        end
  
        selection
      end
    end
  end
end