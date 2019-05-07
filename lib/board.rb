module TicTacToe
  class Board
    attr_reader :cells, :row_size
    
    def initialize(row_size: 3, state: Array.new(row_size**2))
      self.cells = state
      self.row_size = row_size
    end

    def update(cell, token)
      new_state = cells
      new_state[cell] = token
      self.class.new(state: new_state)
    end
    
    def full?
      cells.compact.length == cells.length
    end
   
    def available_cells
      cells.map.with_index{ |cell, i| i if !cell }.compact
    end

    private
    
    attr_writer :cells, :row_size
  end
end