module TicTacToe
  module Setupable
    def self.new_game(**config)
      game_mode = game_mode_selection(config)
      players = player_selection(game_mode, config)

      config[:game].new(config[:board].new, players)
    end

    private
      def self.game_mode_selection(**config)
        config[:output].print_message(config[:messager].message(:game_mode_menu))
        selection = config[:input].get_input
        validity = config[:validator].validate_input(selection, config[:game_mode_options].values)
        
        unless validity[:is_valid]
          config[:output].print_message(config[:messager].message(:not_available))
          return game_mode_selection(config)
        end

        selection
      end

      def self.player_selection(game_mode, **config)
        if game_mode == config[:game_mode_options][:human_v_human]
          human_v_human_players(config)
        else
          human_v_computer_players(config)
        end
      end

      def self.human_v_human_players(**config)
        config[:player_options].values.map do |token| 
          config[:players][:human].new(token)
        end
      end

      def self.human_v_computer_players(**config)
        config[:output].print_message(config[:messager].message(:player_menu))
        selection = config[:input].get_input.upcase
        validity = config[:validator].validate_input(selection, config[:player_options].values)
      
        unless validity[:is_valid]
          config[:output].print_message(config[:messager].message(:not_available))
          return human_v_computer_players(config)
        end
        
        config[:player_options].values.map do |token|
          selection == token ? config[:players][:human].new(token) : config[:players][:computer].new(token)
        end
      end
  end
end