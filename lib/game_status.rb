module TicTacToe
  module GameStatus
    class << self
      def won?(cells)
        check_row_win(cells) || check_column_win(cells) || check_diagonal_win(cells)
      end
  
      def cats_game?(cells)
        cells.compact.length == cells.length && !won?(cells)
      end
  
      def over?(cells)
        won?(cells) || cats_game?(cells)
      end
  
      def available_moves(cells)
        cells.map.with_index{ |cell, i| i if !cell }.compact.map{|cell| (cell += 1).to_s}
      end
      
      private
      
      def get_rows(cells)
        row_size = Math.sqrt(cells.size)
        cells.each_slice(row_size).to_a
      end

      def check_row_win(cells)
        rows = get_rows(cells)
        check_combos(rows)
      end

      def check_column_win(cells)
        columns = get_columns(cells)
        check_combos(columns)
      end

      def check_diagonal_win(cells)
        row_size = Math.sqrt(cells.size)
        nw_to_se_cells = (0..(row_size - 1).to_i).map do |n|
          cells[n * row_size + n]
        end
        sw_to_ne_cells = (0..(row_size - 1).to_i).map do |n|
          cells[n * (row_size - 1) + 2]
        end

        check_combos([nw_to_se_cells, sw_to_ne_cells])
      end

      def check_combos(combos)
        combos.any? do |combo|
          combo.compact.size == combo.size && combo.uniq.size == 1
        end
      end

      def get_columns(cells)
        get_rows(cells).transpose
      end
    end
  end
end