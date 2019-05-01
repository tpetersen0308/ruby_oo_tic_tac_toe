class TicTacToe::Game
  attr_reader :board, :current_player, :next_player
  include TicTacToe::Checkable
  include TicTacToe::IO::Printable
  include TicTacToe::Validateable
  include TicTacToe::Messageable
  include TicTacToe::Formattable

  def initialize(board, players)
    @board = board
    @current_player = players[0]
    @next_player = players[1]
  end

  def turn
    if current_player.human?
      print_message(message(:turn_prompt, current_player.token))
      move = format_move(current_player.move)
      validity = validate_input(move, available_cells(board.cells))
      unless validity[:is_valid]  
        print_message(format_board(board.cells))
        print_message(message(validity[:msg]))
        return turn
      end
    else
      move = current_player.move(available_cells(board.cells))
    end

    new_board = board.update(move, current_player.token)
    self.class.new(new_board, [next_player, current_player])
  end
  
  def play
    print_message(format_board(board.cells)) if current_player.human?
    game = turn
    return game if game.over?(game.board.cells)
    game.play
  end
end