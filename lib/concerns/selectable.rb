module TicTacToe
  module Selectable
    def self.select_option(prompt, options)
      CONFIG.fetch(:output).print_message(prompt)
      selection = CONFIG.fetch(:input).get_input.upcase
      validity = CONFIG.fetch(:validator).validate_input(selection, options)
      
      unless validity[:is_valid]
        CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(validity[:msg]))
        return select_option(prompt, options)
      end

      selection
    end
  end
end