class TicTacToe::Game
  attr_reader :board, :current_player, :next_player, :game_status, :validator, :output, :messager, :formatter, :dependencies

  def initialize(board, players, **dependencies)
    @board = board
    @current_player = players[0]
    @next_player = players[1]
    @dependencies = dependencies
    @game_status = dependencies[:game_status]
    @validator = dependencies[:validator]
    @output = dependencies[:output]
    @messager = dependencies[:messager]
    @formatter = dependencies[:formatter]
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
    self.class.new(new_board, [next_player, current_player], dependencies)
  end
  
  def play
    output.print_message(formatter.format_board(board.cells)) if current_player.human?
    game = turn
    return game if game_status.over?(game.board.cells)
    game.play
  end
end