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

    def move(board_cells)
      formatted_board = formatter.format_board(board_cells)
      prompt = messager.get_message(:turn_prompt, token)
      available_moves = game_status.available_cells(board_cells).map{|cell| (cell += 1).to_s}
      move = option_selector.select_option(formatted_board + prompt, available_moves)
      formatter.format_move(move)
    end

    private
    
    attr_writer :formatter, :messager, :game_status, :option_selector
  end
end