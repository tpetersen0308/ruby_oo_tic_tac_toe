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
    :selector => Selectable,
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

  def self.start
    game = CONFIG[:game_setup].new_game
    game = game.play

    CONFIG[:output].print_message(CONFIG[:formatter].format_board(game.board.cells))

    if CONFIG[:game_status].won?(game.board.cells)
      CONFIG[:output].print_message(CONFIG[:messager].message(:winner, game.next_player.token))
    else
      CONFIG[:output].print_message(CONFIG[:messager].message(:cats_game))
    end

    CONFIG[:output].print_message(CONFIG[:messager].message(:continue))
    continue = CONFIG[:input].get_input

    return start if CONFIG[:continue_options].include?(continue)

    CONFIG[:output].print_message(CONFIG[:messager].message(:goodbye))
  end
end