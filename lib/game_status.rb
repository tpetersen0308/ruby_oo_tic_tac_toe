module TicTacToe
  module GameStatus
    class << self
      def won?(board)
        check_row_win(board) || check_column_win(board) || check_diagonal_win(board)
      end
  
      def cats_game?(board)
        board.full? && !won?(board)
      end
  
      def over?(board)
        won?(board) || cats_game?(board)
      end
      
      private
      
      def check_row_win(board)
        rows = get_rows(board)
        check_combos(rows)
      end
      
      def check_column_win(board)
        columns = get_columns(board)
        check_combos(columns)
      end
      
      def check_diagonal_win(board)
        row_size = board.row_size
        nw_to_se_cells = (0..(row_size - 1).to_i).map do |n|
          board.cells[n * row_size + n]
        end
        sw_to_ne_cells = (0..(row_size - 1).to_i).map do |n|
          board.cells[n * (row_size - 1) + 2]
        end
        
        check_combos([nw_to_se_cells, sw_to_ne_cells])
      end
      
      def check_combos(combos)
        combos.any? do |combo|
          combo.compact.size == combo.size && combo.uniq.size == 1
        end
      end
      
      def get_rows(board)
        board.cells.each_slice(board.row_size).to_a
      end
      
      def get_columns(board)
        get_rows(board).transpose
      end
    end
  end
end