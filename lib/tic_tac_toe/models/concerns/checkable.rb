module TicTacToe::Checkable
  def self.won?(cells)
    check_row_win(cells) || check_column_win(cells) || check_diagonal_win(cells)
  end

  def self.cats_game?(cells)
    cells.compact.length == cells.length && !won?(cells)
  end

  def self.over?(cells)
    won?(cells) || cats_game?(cells)
  end

  private
    def self.check_row_win(cells)
      rows = get_rows(cells)
      check_combos(rows)
    end

    def self.check_column_win(cells)
      columns = get_columns(cells)
      check_combos(columns)
    end

    def self.check_diagonal_win(cells)
      row_size = Math.sqrt(cells.size)
      nw_to_se_cells = (0..(row_size - 1).to_i).map do |n|
        cells[n * row_size + n]
      end
      sw_to_ne_cells = (0..(row_size - 1).to_i).map do |n|
        cells[n * (row_size - 1) + 2]
      end

      check_combos([nw_to_se_cells, sw_to_ne_cells])
    end

    def self.check_combos(combos)
      combos.any? do |combo|
        combo.compact.size == combo.size && combo.uniq.size == 1
      end
    end

    def self.get_rows(cells)
      row_size = Math.sqrt(cells.size)
      cells.each_slice(row_size).to_a
    end

    def self.get_columns(cells)
      get_rows(cells).transpose
    end
end