module TicTacToe
  class Game
    attr_reader :board, :current_player, :next_player, :game_status, :validator, :output, :messager, :formatter
  
    def initialize(board, players)
      self.board = board
      self.current_player = players[0]
      self.next_player = players[1]
      self.game_status = CONFIG.fetch(:game_status)
      self.validator = CONFIG.fetch(:validator)
      self.output = CONFIG.fetch(:output)
      self.messager = CONFIG.fetch(:messager)
      self.formatter = CONFIG.fetch(:formatter)
    end
  
    def turn
      move = current_player.move(board.cells)
      new_board = board.update(move, current_player.token)
      self.class.new(new_board, [next_player, current_player])
    end
    
    def play
      game = turn
      return game if game_status.over?(game.board.cells)
      game.play
    end
    
    private
      
    attr_writer :board, :current_player, :next_player, :game_status, :validator, :output, :messager, :formatter
  end
end