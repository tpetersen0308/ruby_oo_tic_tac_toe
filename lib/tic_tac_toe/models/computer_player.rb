class TicTacToe::ComputerPlayer < TicTacToe::Player
  def move(board)
    board.available_cells.sample
  end
end