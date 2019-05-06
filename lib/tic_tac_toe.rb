require_relative './game_setup.rb'
require_relative './game_status.rb'
require_relative './game_io.rb'
require_relative './io_formatter.rb'
require_relative './messager.rb'

module TicTacToe
  def self.start(
    game_setup = GameSetup,
    game_status = GameStatus,
    game_io = GameIO,
    formatter = IOFormatter,
    messager = Messager,
    continue_options = ["y", "Y"]
  )

    game_io.print_message(messager.get_message(:welcome))

    game = game_setup.new_game
    game = game.play

    game_io.print_message(formatter.format_board(game.board.cells))

    if game_status.won?(game.board.cells)
      game_io.print_message(messager.get_message(:winner, game.next_player.token))
    else
      game_io.print_message(messager.get_message(:cats_game))
    end

    game_io.print_message(messager.get_message(:continue))
    continue = game_io.get_input

    return start if continue_options.include?(continue)

    game_io.print_message(messager.get_message(:goodbye))
  end
end