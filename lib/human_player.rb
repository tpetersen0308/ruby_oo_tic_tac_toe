module TicTacToe
  class HumanPlayer < Player
    attr_reader :ui, :formatter, :messager, :game_status, :option_selector
    
    def initialize(token, 
      ui = CONFIG.fetch(:input),
      formatter = CONFIG.fetch(:formatter),
      messager = CONFIG.fetch(:messager),
      game_status = CONFIG.fetch(:game_status),
      option_selector = CONFIG.fetch(:option_selector)
    )
      super(token)
      self.ui = ui
      self.formatter = formatter 
      self.messager = messager 
      self.game_status = game_status 
      self.option_selector = option_selector 
    end

    def move(board_cells)
      formatted_board = formatter.format_board(board_cells)
      prompt = messager.message(:turn_prompt, self.token)
      available_moves = game_status.available_cells(board_cells).map{|cell| (cell += 1).to_s}
      move = option_selector.select_option(formatted_board + prompt, available_moves)
      formatter.format_move(move)
    end

    private
      attr_writer :ui, :formatter, :messager, :game_status, :option_selector
  end
end