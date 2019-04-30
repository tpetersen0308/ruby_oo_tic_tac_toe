class TicTacToe::ComputerPlayer < TicTacToe::Player
  attr_reader :board_reader

  def initialize(token, board_reader: nil)
    super(token)
    @board_reader = board_reader
  end
  
  def move
    self.board_reader.available_cells.sample
  end
end