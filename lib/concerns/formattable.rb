module TicTacToe
  module Formattable
    def self.format_board(cells)
      formatted_cells = format_cells(cells)
      formatted_rows = format_rows(formatted_cells)
      formatted_rows.join("\n" + "-"*formatted_rows.first.size + "\n")
    end

    def self.format_move(input)
      input.to_i.to_s == input ? input.to_i - 1 : input
    end

    private
      def self.format_cells(cells)
        cells.map.with_index{|cell, i| (cell || (i + 1).to_s).center(3)}
      end

      def self.format_rows(formatted_cells)
        row_size = Math.sqrt(formatted_cells.size)
        formatted_cells.each_slice(row_size).to_a.map{|row| row.join("|")}
      end
  end
end