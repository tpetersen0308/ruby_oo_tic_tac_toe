module TicTacToe::Checkable
  def self.won?(board)
    check_row_win(board) || check_column_win(board) || check_diagonal_win(board)
  end

  def self.cats_game?(board)
    board.compact.length == board.length && !won?(board)
  end

  private
    def self.check_row_win(board)
      rows = get_rows(board)
      check_combos(rows)
    end

    def self.check_column_win(board)
      columns = get_columns(board)
      check_combos(columns)
    end

    def self.check_diagonal_win(board)
      row_size = Math.sqrt(board.size)
      nw_to_se_cells = (0..(row_size - 1).to_i).map do |n|
        board[n * row_size + n]
      end
      sw_to_ne_cells = (0..(row_size - 1).to_i).map do |n|
        board[n * (row_size - 1) + 2]
      end

      check_combos([nw_to_se_cells, sw_to_ne_cells])
    end

    def self.check_combos(combos)
      combos.any? do |combo|
        combo.compact.size == combo.size && combo.uniq.size == 1
      end
    end

    def self.get_rows(board)
      row_size = Math.sqrt(board.size)
      board.each_slice(row_size).to_a
    end

    def self.get_columns(board)
      get_rows(board).transpose
    end
end