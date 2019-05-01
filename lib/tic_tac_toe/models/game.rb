class TicTacToe::Game
  attr_reader :board, :current_player, :next_player
  include TicTacToe::Checkable
  include TicTacToe::IO::Printable
  include TicTacToe::Validateable

  def initialize(board, players)
    @board = board
    @current_player = players[0]
    @next_player = players[1]
  end

  def turn
    if current_player.human?
      print_message("\nIt is #{current_player.token}'s turn.\nPlease select an available position.")
      move = current_player.move
      unless validate_input(move, available_cells(board.cells))[:is_valid]
        print_board(board.cells)
        print_message("\nInvalid input.\n")
        return turn
      end
    else
      move = current_player.move(available_cells(board.cells))
    end

    new_board = board.update(move, current_player.token)
    self.class.new(new_board, [next_player, current_player])
  end
  
  def play
    print_board(board.cells) if current_player.human?
    game = turn
    return game if game.over?(game.board.cells)
    game.play
  end
end