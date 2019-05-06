require_relative './game_status.rb'
require_relative './io_formatter.rb'
require_relative './game_io.rb'

module TicTacToe
  class Game
    attr_reader :board, :current_player, :next_player, :game_status, :formatter, :game_io
  
    def initialize(
      board, 
      players, 
      game_status = GameStatus, 
      formatter = IOFormatter,
      game_io = GameIO  
    )
      self.board = board
      self.current_player = players[0]
      self.next_player = players[1]
      self.game_status = game_status
      self.formatter = formatter
      self.game_io = game_io
    end
  
    def turn
      game_io.print_message(formatter.format_board(board.cells))
      available_moves = game_status.available_cells(board.cells).map{|cell| (cell += 1).to_s}
      move = formatter.format_move(current_player.move(available_moves))
      new_board = board.update(move, current_player.token)
      self.class.new(new_board, [next_player, current_player])
    end
    
    def play
      game = turn
      return game if game_status.over?(game.board.cells)
      game.play
    end
    
    private
      
    attr_writer :board, :current_player, :next_player, :game_status, :formatter, :game_io
  end
end