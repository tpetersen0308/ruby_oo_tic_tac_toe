require_relative '../config/environment.rb'
require_relative './board.rb'

module TicTacToe
  class LiteBoard < Board
    attr_reader :db
    def initialize(db:, **kwargs)
      super(**kwargs)
      self.db = db
    end

    def update
      moves = db.get_last_n_moves(6)
      new_cells = Array.new(row_size**2, empty_cell_state)
      moves.each { |move| new_cells[move['position']] = move['player'] }
      self.class.new(db: db, state: new_cells)
    end

    private

    attr_writer :db
  end
end
