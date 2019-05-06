require 'spec_helper'
require_relative '../lib/io_formatter.rb'

RSpec.describe TicTacToe::IOFormatter do
  it 'can format the board for printing' do
    cells = ["X", nil, "X", nil, "O", nil, nil, nil, nil]
    formatted_board = " X | 2 | X \n-----------\n 4 | O | 6 \n-----------\n 7 | 8 | 9 "
    expect(TicTacToe::IOFormatter.format_board(cells)).to eq(formatted_board)
  end
end