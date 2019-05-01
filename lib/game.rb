class TicTacToe::Game
  attr_reader :board, :current_player, :next_player, :game_status, :validator, :output

  include TicTacToe::Messageable
  include TicTacToe::Formattable

  def initialize(board, players, game_status: nil, validator: nil, output: nil )
    @board = board
    @current_player = players[0]
    @next_player = players[1]
    @game_status = game_status
    @validator = validator
    @output = output
  end

  def turn
    if current_player.human?
      output.print_message(message(:turn_prompt, current_player.token))
      move = format_move(current_player.move)
      validity = validator.validate_input(move, game_status.available_cells(board.cells))
      unless validity[:is_valid]  
        output.print_message(format_board(board.cells))
        output.print_message(message(validity[:msg]))
        return turn
      end
    else
      move = current_player.move(game_status.available_cells(board.cells))
    end

    new_board = board.update(move, current_player.token)
    self.class.new(new_board, [next_player, current_player], game_status: game_status, validator: validator, output: output)
  end
  
  def play
    output.print_message(format_board(board.cells)) if current_player.human?
    game = turn
    return game if game_status.over?(game.board.cells)
    game.play
  end
end