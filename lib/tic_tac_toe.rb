require_relative './concerns/checkable.rb'
require_relative './concerns/formattable.rb'
require_relative './concerns/getable.rb'
require_relative './concerns/printable.rb'
require_relative './concerns/validateable.rb'
require_relative './concerns/messageable.rb'
require_relative './concerns/setupable.rb'
require_relative './concerns/selectable.rb'
require_relative './board.rb'
require_relative './player.rb'
require_relative './computer_player.rb'
require_relative './human_player.rb'
require_relative './game.rb'

module TicTacToe
  CONFIG = {
    :players => {
      :human => HumanPlayer,
      :computer => ComputerPlayer,
    },
    :board => Board,
    :game => Game,
    :game_status => Checkable,
    :game_setup => Setupable,
    :validator => Validateable,
    :messager => Messageable,
    :input => IO::Getable,
    :output => IO::Printable,
    :formatter => Formattable,
    :option_selector => Selectable,
    :game_mode_options => {
      :human_v_human => "1",
      :human_v_computer => "2",
    },
    :player_options => {
      :player1 => "X",
      :player2 => "O",
    },
    :continue_options => ["y","Y"]
  }

  def self.start(
    game_setup = CONFIG.fetch(:game_setup),
    game_status = CONFIG.fetch(:game_status),
    output = CONFIG.fetch(:output),
    input = CONFIG.fetch(:input),
    formatter = CONFIG.fetch(:formatter),
    messager = CONFIG.fetch(:messager),
    continue_options = CONFIG.fetch(:continue_options)
  )

    output.print_message(messager.message(:welcome))

    game = game_setup.new_game
    game = game.play

    output.print_message(formatter.format_board(game.board.cells))

    if game_status.won?(game.board.cells)
      output.print_message(messager.message(:winner, game.next_player.token))
    else
      output.print_message(messager.message(:cats_game))
    end

    output.print_message(messager.message(:continue))
    continue = input.get_input

    return start if continue_options.include?(continue)

    output.print_message(messager.message(:goodbye))
  end
end