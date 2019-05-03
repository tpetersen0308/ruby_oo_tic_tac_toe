module TicTacToe
  module Setupable
    class << self
      def new_game(
        option_selector = CONFIG.fetch(:option_selector), 
        messager = CONFIG.fetch(:messager), 
        game_mode_options = CONFIG.fetch(:game_mode_options), 
        game = CONFIG.fetch(:game), 
        board = CONFIG.fetch(:board), 
        player_options = CONFIG.fetch(:player_options), 
        players = CONFIG.fetch(:players)
      )
      
        game_mode_menu = messager.message(:game_mode_menu)
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
          player_menu = messager.message(:player_menu)
          selection = option_selector.select_option(player_menu, player_options.values)
          
          players = player_options.values.map do |token|
            selection == token ? players.fetch(:human).new(token) : players.fetch(:computer).new(token)
          end
        end
    end
  end
end