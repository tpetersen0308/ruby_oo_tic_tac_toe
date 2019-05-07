require_relative './game_status.rb'
require_relative './io_formatter.rb'
require_relative './game_io.rb'
require_relative './messager.rb'

module TicTacToe
  class Game
    attr_reader :board, :current_player, :next_player, :game_status, :formatter, :game_io, :messager
  
    def initialize(
      board, 
      players, 
      game_status = GameStatus, 
      formatter = IOFormatter,
      game_io = GameIO,
      messager = Messager  
    )
      self.board = board
      self.current_player = players[0]
      self.next_player = players[1]
      self.game_status = game_status
      self.formatter = formatter
      self.game_io = game_io
      self.messager = messager
    end
  
    def turn
      game_io.print_message(messager.get_message(:turn_prompt, current_player.token))
      
      available_moves = board.available_cells.map{ |cell| (cell += 1).to_s }
      move = formatter.format_move(current_player.move(available_moves))
      
      board.update(move, current_player.token)
    end
    
    def play
      game_io.print_message(formatter.format_board(board.cells))
      
      updated_board = turn
      game = self.class.new(updated_board, [next_player, current_player])
      
      return game if game_status.over?(game.board)
      game.play
    end
    
    private
      
    attr_writer :board, :current_player, :next_player, :game_status, :formatter, :game_io, :messager
  end
end