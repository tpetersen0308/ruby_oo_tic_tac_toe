module TicTacToe
  class Board
    attr_accessor :cells
    
    def initialize(row_size: 3, state: Array.new(row_size**2))
      self.cells = state
    end

    def update(cell, token)
      new_state = cells
      new_state[cell] = token
      self.class.new(state: new_state)
    end
    
    def full?
      cells.compact.length == cells.length
    end
  end
end