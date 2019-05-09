require 'spec_helper'
require 'sqlite3'
require_relative '../lib/lite_board.rb'
require_relative '../lib/move_database.rb'

RSpec.describe TicTacToe::LiteBoard do
  let(:database) { TicTacToe::MoveDatabase.new }
  it "only returns board with each player's three latest moves" do
    board = TicTacToe::LiteBoard.new(move_database: database)
    [['X', 0], ['O', 2], ['X', 6], ['O', 3], ['X', 8], ['O', 7], ['X', 4]].each do |token, position|
      database.add_move(token, position)
    end

    updated_board = board.update
    expected_board = TicTacToe::LiteBoard.new(move_database: database, state: [nil, nil, 'O', 'O', 'X', nil, 'X', 'O', 'X'])

    expect(updated_board.cells).to eq(expected_board.cells)
  end
end
