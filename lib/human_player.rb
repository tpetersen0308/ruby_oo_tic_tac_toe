module TicTacToe
  class HumanPlayer < Player
    attr_reader :ui, :formatter, :messager, :game_status, :selector
    
    def initialize(token, 
      ui = CONFIG.fetch(:input),
      formatter = CONFIG.fetch(:formatter),
      messager = CONFIG.fetch(:messager),
      game_status = CONFIG.fetch(:game_status),
      selector = CONFIG.fetch(:selector)
    )
      super(token)
      self.ui = ui
      self.formatter = formatter 
      self.messager = messager 
      self.game_status = game_status 
      self.selector = selector 
    end

    def move(board_cells)
      formatted_board = formatter.format_board(board_cells)
      prompt = messager.message(:turn_prompt, self.token)
      available_moves = game_status.available_cells(board_cells).map{|cell| (cell += 1).to_s}
      move = selector.select_option(formatted_board + prompt, available_moves)
      formatter.format_move(move)
    end

    def human?
      true
    end

    private
      attr_writer :ui, :formatter, :messager, :game_status, :selector
  end
end