module TicTacToe
  module Selectable
    def self.select_option(prompt, options)
      CONFIG.fetch(:output).print_message(prompt)
      selection = CONFIG.fetch(:input).get_input.upcase
      
      unless CONFIG.fetch(:validator).validate_input(selection, options)
        CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(:not_available))
        return select_option(prompt, options)
      end

      selection
    end
  end
end