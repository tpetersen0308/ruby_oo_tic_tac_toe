require 'spec_helper'
require 'sqlite3'
require_relative '../lib/standard_board.rb'

RSpec.describe TicTacToe::StandardBoard do
  before :each do
    @db = MoveDatabase.new
  end
  it 'can return an updated board' do
    board = TicTacToe::StandardBoard.new(move_database: @db)
    [['X', 2], ['O', 4], ['X', 6], ['O', 8]].each do |token, position|
      @db.add_move(token, position)
    end
    updated_board = board.update
    expected_board = TicTacToe::StandardBoard.new(move_database: @db, state: [nil, nil, 'X', nil, 'O', nil, 'X', nil, 'O'])

    expect(updated_board.cells).to eq(expected_board.cells)
  end
end
