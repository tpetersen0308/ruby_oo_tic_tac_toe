module TicTacToe
  module Setupable
    def self.new_game
      game_mode_menu = CONFIG.fetch(:messager).message(:game_mode_menu)
      game_mode = CONFIG.fetch(:selector).select_option(game_mode_menu, CONFIG.fetch(:game_mode_options).values)

      players = case game_mode 
      when CONFIG.fetch(:game_mode_options).fetch(:human_v_human)
        setup_players_for_human_v_human_game
      when CONFIG.fetch(:game_mode_options).fetch(:human_v_computer)
        setup_players_for_human_v_computer_game
      end

      CONFIG.fetch(:game).new(CONFIG.fetch(:board).new, players)
    end

    private
      def self.setup_players_for_human_v_human_game
        players = CONFIG.fetch(:player_options).values.map do |token| 
          CONFIG.fetch(:players).fetch(:human).new(token)
        end
      end

      def self.setup_players_for_human_v_computer_game
        player_menu = CONFIG.fetch(:messager).message(:player_menu)
        selection = CONFIG.fetch(:selector).select_option(player_menu, CONFIG.fetch(:player_options).values)
        
        players = CONFIG.fetch(:player_options).values.map do |token|
          selection == token ? CONFIG.fetch(:players).fetch(:human).new(token) : CONFIG.fetch(:players).fetch(:computer).new(token)
        end
      end
  end
end