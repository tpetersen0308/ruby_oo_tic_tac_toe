require_relative './player.rb'
require_relative './io_formatter'
require_relative './messager.rb'
require_relative './game_status.rb'
require_relative './game_option_selector.rb'

module TicTacToe
  class HumanPlayer < Player
    attr_reader :formatter, :messager, :game_status, :option_selector
    
    def initialize(
      token,
      formatter = IOFormatter,
      messager = Messager,
      game_status = GameStatus,
      option_selector = GameOptionSelector
    )
      super(token)
      self.formatter = formatter 
      self.messager = messager 
      self.game_status = game_status 
      self.option_selector = option_selector 
    end

    def move(available_moves)
      prompt = messager.get_message(:turn_prompt, token)
      option_selector.select_option(prompt, available_moves)
    end

    private
    
    attr_writer :formatter, :messager, :game_status, :option_selector
  end
end