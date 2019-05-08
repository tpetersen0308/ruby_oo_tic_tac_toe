require_relative './game_option_selector.rb'
require_relative './messager.rb'
require_relative './game_io.rb'
require_relative './game.rb'
require_relative './standard_board.rb'
require_relative './lite_board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'
require_relative './move_database.rb'

module TicTacToe
  module GameSetup
    class << self
      def new_game(
        option_selector = GameOptionSelector,
        messager = Messager,
        game = Game,
        move_database = MoveDatabase,
        game_io = GameIO,
        boards = {
          standard_board: StandardBoard,
          lite_board: LiteBoard
        },
        players = {
          human: HumanPlayer,
          computer: ComputerPlayer
        },
        game_mode_options = {
          tic_tac_toe: '1',
          lite_3: '2'
        },
        player_mode_options = {
          human_v_human: '1',
          human_v_computer: '2'
        },
        player_options = {
          player1: 'X',
          player2: 'O'
        }
      )

        database = move_database.new

        game_io.print_message(messager.get_message(:game_mode_menu))
        board = setup_board_per_game_mode(option_selector, game_mode_options, boards, database)

        game_io.print_message(messager.get_message(:player_mode_menu))
        players = setup_players_per_player_mode(option_selector, player_mode_options, player_options, players, messager, game_io)

        game.new(board, players, database)
      end

      private

      def setup_board_per_game_mode(option_selector, game_mode_options, boards, database)
        case option_selector.select_option(game_mode_options.values)
        when game_mode_options.fetch(:tic_tac_toe)
          boards.fetch(:standard_board).new(db: database)
        when game_mode_options.fetch(:lite_3)
          boards.fetch(:lite_board).new(db: database)
        end
      end

      def setup_players_per_player_mode(option_selector, player_mode_options, player_options, players, messager, game_io)
        case option_selector.select_option(player_mode_options.values)
        when player_mode_options.fetch(:human_v_human)
          setup_players_for_human_v_human_game(players.fetch(:human), player_options)
        when player_mode_options.fetch(:human_v_computer)
          setup_players_for_human_v_computer_game(option_selector, player_options, players, messager, game_io)
        end
      end

      def setup_players_for_human_v_human_game(human_player, player_options)
        player_options.values.map do |token|
          human_player.new(token)
        end
      end

      def setup_players_for_human_v_computer_game(option_selector, player_options, players, messager, game_io)
        game_io.print_message(messager.get_message(:player_menu))
        selection = option_selector.select_option(player_options.values)

        players = player_options.values.map do |token|
          selection == token ? players.fetch(:human).new(token) : players.fetch(:computer).new(token)
        end
      end
    end
  end
end
