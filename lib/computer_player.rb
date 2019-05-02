module TicTacToe
  class ComputerPlayer < Player
    def initialize(token)
      super(token)
    end
    
    def move(board_cells)
      CONFIG.fetch(:game_status).available_cells(board_cells).sample
    end

    def human?
      false
    end
  end
end