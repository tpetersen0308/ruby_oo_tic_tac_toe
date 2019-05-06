require_relative './game_status.rb'
require_relative './player.rb'

module TicTacToe
  class ComputerPlayer < Player
    attr_reader :game_status

    def initialize(token, game_status = GameStatus)
      super(token)
      self.game_status = game_status
    end
    
    def move(available_moves)
      available_moves.sample
    end

    private 
    
    attr_writer :game_status
  end
end