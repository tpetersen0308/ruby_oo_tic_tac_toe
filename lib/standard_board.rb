require_relative '../config/environment.rb'
require_relative './board.rb'

module TicTacToe
  class StandardBoard < Board
    attr_reader :move_database
    def initialize(move_database: DB[:conn], **kwargs)
      super(**kwargs)
      self.move_database = move_database
    end

    def update
      populated_cells = populate_cells(move_database.all_moves)
      self.class.new(move_database: move_database, state: populated_cells)
    end

    private

    attr_writer :move_database
  end
end
