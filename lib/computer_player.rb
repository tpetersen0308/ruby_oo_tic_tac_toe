module TicTacToe
  class ComputerPlayer < Player
    attr_reader :game_status

    def initialize(token, game_status = CONFIG.fetch(:game_status))
      super(token)
      self.game_status = game_status
    end
    
    def move(board_cells)
      game_status.available_cells(board_cells).sample
    end

    private 
    
    attr_writer :game_status
  end
end