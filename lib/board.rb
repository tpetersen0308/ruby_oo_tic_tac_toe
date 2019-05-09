module TicTacToe
  class Board
    attr_reader :cells, :row_size, :empty_cell_state

    def initialize(row_size: 3,
                   empty_cell_state: nil,
                   state: Array.new(row_size**2, empty_cell_state))
      self.cells = state
      self.empty_cell_state = empty_cell_state
      self.row_size = row_size
    end

    def full?
      available_positions.empty?
    end

    def available_positions
      positions = (0..(cells.length - 1)).to_a
      positions.select { |position| available?(position) }
    end

    def available?(position)
      cells[position] == empty_cell_state
    end

    private

    attr_writer :cells, :row_size, :empty_cell_state

    def populate_cells(moves)
      new_cells = Array.new(row_size**2, empty_cell_state)
      moves.each { |move| new_cells[move['position']] = move['player'] }
      new_cells
    end
  end
end
