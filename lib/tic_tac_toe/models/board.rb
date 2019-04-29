class TicTacToe::Board
  attr_accessor :cells
  
  def initialize(row_size=3, state=Array.new(row_size**2))
    self.cells = state
  end
end