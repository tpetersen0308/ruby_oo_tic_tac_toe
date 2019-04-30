class TicTacToe::ComputerPlayer < TicTacToe::Player
  def initialize(token, board_reader: nil)
    super(token)
    @board_reader = board_reader
  end
  
  def move
    @board_reader.available_cells.sample
  end
end