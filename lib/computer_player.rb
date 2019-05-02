module TicTacToe
  class ComputerPlayer < Player
    def initialize(token)
      super(token)
    end
    
    def move(available_cells)
      available_cells.sample
    end

    def human?
      false
    end
  end
end