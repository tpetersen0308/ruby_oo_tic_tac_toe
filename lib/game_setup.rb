require_relative './game_option_selector.rb'
require_relative './messager.rb'
require_relative './game.rb'
require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'

module TicTacToe
  module GameSetup
    class << self
      def new_game(
        option_selector = GameOptionSelector, 
        messager = Messager, 
        game = Game, 
        board = Board, 
        players = {
          :human => HumanPlayer,
          :computer => ComputerPlayer
        },
        game_mode_options = {
          :human_v_human => "1",
          :human_v_computer => "2" 
        }, 
        player_options = {
          :player1 => "X",
          :player2 => "O",
        }
      )
      
        game_mode_menu = messager.get_message(:game_mode_menu)
        game_mode = option_selector.select_option(game_mode_menu, game_mode_options.values)
  
        players = case game_mode 
          when game_mode_options.fetch(:human_v_human)
            setup_players_for_human_v_human_game(players.fetch(:human), player_options)
          when game_mode_options.fetch(:human_v_computer)
            setup_players_for_human_v_computer_game(option_selector, player_options, players, messager)
          end
  
        game.new(board.new, players)
      end
  
      private
      
      def setup_players_for_human_v_human_game(human_player, player_options)
        players = player_options.values.map do |token| 
          human_player.new(token)
        end
      end

      def setup_players_for_human_v_computer_game(option_selector, player_options, players, messager)
        player_menu = messager.get_message(:player_menu)
        selection = option_selector.select_option(player_menu, player_options.values)
        
        players = player_options.values.map do |token|
          selection == token ? players.fetch(:human).new(token) : players.fetch(:computer).new(token)
        end
      end
    end
  end
end