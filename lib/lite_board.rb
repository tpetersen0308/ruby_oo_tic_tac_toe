require_relative '../config/environment.rb'
require_relative './board.rb'

module TicTacToe
  class LiteBoard < Board
    attr_reader :move_database
    def initialize(move_database:, **kwargs)
      super(**kwargs)
      self.move_database = move_database
    end

    def update
      moves = move_database.get_last_n_moves(6)
      new_cells = Array.new(row_size**2, empty_cell_state)
      moves.each { |move| new_cells[move['position']] = move['player'] }
      self.class.new(move_database: move_database, state: new_cells)
    end

    private

    attr_writer :move_database
  end
end
