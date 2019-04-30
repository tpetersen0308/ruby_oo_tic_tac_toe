class TicTacToe::Game
  attr_reader :board, :current_player, :next_player
  include TicTacToe::Checkable
  include TicTacToe::IO::Printable

  def initialize(board, players)
    @board = board
    @current_player = players[0]
    @next_player = players[1]
  end

  def turn
    move = current_player.move
    new_board = board.update(move, current_player.token)
    self.class.new(new_board, [next_player, current_player])
  end
  
  def play
    if current_player.class == TicTacToe::HumanPlayer
      print_board(board.cells)
      print_message("It is #{current_player.token}'s turn:\n>>")
    end
    game = turn
    return game if game.over?(game.board.cells)
    game.play
  end
end