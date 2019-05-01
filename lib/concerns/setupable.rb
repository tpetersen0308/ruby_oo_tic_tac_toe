module TicTacToe::Setupable
  def new_game(**config)
    game_mode = game_mode_selection(config)
    players = player_selection(game_mode, config)

    config[:game].new(config[:board].new, players, config)
  end

  private
    def game_mode_selection(**config)
      config[:output].print_message(config[:messager].message(:game_mode_menu))
      selection = config[:input].get_input
      validity = config[:validator].validate_input(selection, config[:game_mode_options].values)
      
      unless validity[:is_valid]
        config[:output].print_message(config[:messager].message(validity[:msg]))
        return game_mode_selection(config)
      end

      selection
    end

    def player_selection(game_mode, **config)
      if game_mode == config[:game_mode_options][:human_v_human]
        human_v_human_players(config)
      else
        human_v_computer_players(config)
      end
    end

    def human_v_human_players(**config)
      config[:player_options].values.map do |token| 
        config[:players][:human].new(token, ui: config[:input])
      end
    end

    def human_v_computer_players(**config)
      config[:output].print_message(config[:messager].message(:player_menu))
      selection = config[:input].get_input.upcase
      validity = config[:validator].validate_input(selection, config[:player_options].values)
    
      unless validity[:is_valid]
        config[:output].print_message(config[:messager].message(validity[:msg]))
        return human_v_computer_players(config)
      end
      
      player1_token, player2token = config[:player_options].values
      human_token, computer_token = selection, selection == player1_token ? player2token : player1_token

      human_player = config[:players][:human].new(human_token, ui: config[:input])
      computer_player = config[:players][:computer].new(computer_token)
      
      selection == player1_token ? [human_player, computer_player] : [computer_player, human_player]
    end
end