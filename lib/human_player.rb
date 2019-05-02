module TicTacToe
  class HumanPlayer < Player
    attr_reader :ui
    
    def initialize(token, ui = CONFIG.fetch(:input))
      super(token)
      self.ui = ui
    end

    def move(board_cells)
      CONFIG.fetch(:output).print_message(CONFIG.fetch(:formatter).format_board(board_cells))
      CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(:turn_prompt, self.token))
      move = CONFIG.fetch(:formatter).format_move(self.ui.get_input)
      validity = CONFIG.fetch(:validator).validate_input(move, CONFIG.fetch(:game_status).available_cells(board_cells))
      
      unless validity[:is_valid]  
        CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(validity[:msg]))
        return move(board_cells)
      end
      
      move
    end

    # def self.select_menu_option(menu, options)
    #   CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(menu))
    #   selection = CONFIG.fetch(:input).get_input.upcase
    #   validity = CONFIG.fetch(:validator).validate_input(selection, options)
      
    #   unless validity[:is_valid]
    #     CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(:not_available))
    #     return select_menu_option(menu, options)
    #   end

    #   selection
    # end
    def human?
      true
    end

    private
      attr_writer :ui
  end
end