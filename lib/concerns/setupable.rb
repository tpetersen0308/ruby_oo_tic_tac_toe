module TicTacToe
  module Setupable
    def self.new_game
      game_mode = game_mode_selection
      players = player_selection(game_mode)

      CONFIG.fetch(:game).new(CONFIG.fetch(:board).new, players)
    end

    private
      def self.game_mode_selection
        CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(:game_mode_menu))
        selection = CONFIG.fetch(:input).get_input
        validity = CONFIG.fetch(:validator).validate_input(selection, CONFIG.fetch(:game_mode_options).values)
        
        unless validity[:is_valid]
          CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(:not_available))
          return game_mode_selection
        end

        selection
      end

      def self.player_selection(game_mode)
        if game_mode == CONFIG.fetch(:game_mode_options)[:human_v_human]
          human_v_human_players
        else
          human_v_computer_players
        end
      end

      def self.human_v_human_players
        CONFIG.fetch(:player_options).values.map do |token| 
          CONFIG.fetch(:players)[:human].new(token)
        end
      end

      def self.human_v_computer_players
        CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(:player_menu))
        selection = CONFIG.fetch(:input).get_input.upcase
        validity = CONFIG.fetch(:validator).validate_input(selection, CONFIG.fetch(:player_options).values)
      
        unless validity[:is_valid]
          CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(:not_available))
          return human_v_computer_players
        end
        
        CONFIG.fetch(:player_options).values.map do |token|
          selection == token ? CONFIG.fetch(:players)[:human].new(token) : CONFIG.fetch(:players)[:computer].new(token)
        end
      end
  end
end