module TicTacToe
  class Game
    attr_reader :board, :current_player, :next_player, :game_status, :validator, :output, :messager, :formatter
  
    def initialize(board, players)
      @board = board
      @current_player = players[0]
      @next_player = players[1]
      @game_status = TicTacToe::CONFIG[:game_status]
      @validator = TicTacToe::CONFIG[:validator]
      @output = TicTacToe::CONFIG[:output]
      @messager = TicTacToe::CONFIG[:messager]
      @formatter = TicTacToe::CONFIG[:formatter]
    end
  
    def turn
      if current_player.human?
      
        output.print_message(messager.message(:turn_prompt, current_player.token))
        move = formatter.format_move(current_player.move)
        validity = validator.validate_input(move, game_status.available_cells(board.cells))
        
        unless validity[:is_valid]  
          output.print_message(formatter.format_board(board.cells))
          output.print_message(messager.message(validity[:msg]))
          return turn
        end
      
      else
        move = current_player.move(game_status.available_cells(board.cells))
      end
  
      new_board = board.update(move, current_player.token)
      self.class.new(new_board, [next_player, current_player])
    end
    
    def play
      output.print_message(formatter.format_board(board.cells)) if current_player.human?
      game = turn
      return game if game_status.over?(game.board.cells)
      game.play
    end
  end
end