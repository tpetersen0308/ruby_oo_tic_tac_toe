module TicTacToe
  module Setupable
    def self.new_game
      game_mode = select_menu_option(:game_mode_menu, CONFIG.fetch(:game_mode_options).values)
      players = select_players(game_mode)

      CONFIG.fetch(:game).new(CONFIG.fetch(:board).new, players)
    end

    private
      def self.select_players(game_mode)
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
        selection = select_menu_option(:player_menu, CONFIG.fetch(:player_options).values)
        
        CONFIG.fetch(:player_options).values.map do |token|
          selection == token ? CONFIG.fetch(:players)[:human].new(token) : CONFIG.fetch(:players)[:computer].new(token)
        end
      end

      def self.select_menu_option(menu, options)
        CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(menu))
        selection = CONFIG.fetch(:input).get_input.upcase
        validity = CONFIG.fetch(:validator).validate_input(selection, options)
        
        unless validity[:is_valid]
          CONFIG.fetch(:output).print_message(CONFIG.fetch(:messager).message(:not_available))
          return select_menu_option(menu, options)
        end

        selection
      end
  end
end