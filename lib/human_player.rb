module TicTacToe
  class HumanPlayer < Player
    attr_reader :ui
    
    def initialize(token, ui = CONFIG.fetch(:input))
      super(token)
      self.ui = ui
    end

    def move(board_cells)
      formatted_board = CONFIG.fetch(:formatter).format_board(board_cells)
      prompt = CONFIG.fetch(:messager).message(:turn_prompt, self.token)
      available_moves = CONFIG.fetch(:game_status).available_cells(board_cells).map{|cell| (cell += 1).to_s}
      move = CONFIG.fetch(:selector).select_option(formatted_board + prompt, available_moves)
      CONFIG.fetch(:formatter).format_move(move)
    end

    def human?
      true
    end

    private
      attr_writer :ui
  end
end