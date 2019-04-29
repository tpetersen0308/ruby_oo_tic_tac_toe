class TicTacToe::Board
  attr_accessor :cells
  
  def initialize(row_size: 3, state: Array.new(row_size**2))
    self.cells = state
  end

  def update(cell, token)
    new_state = self.cells
    new_state[cell] = token
    self.class.new(state: new_state)
  end
  
  def full?
    self.cells.compact.length == self.cells.length
  end

  def available_cells
    self.cells.map.with_index{ |cell, i| i if !cell }.compact
  end
end