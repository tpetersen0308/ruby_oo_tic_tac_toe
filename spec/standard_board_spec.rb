require 'spec_helper'
require 'sqlite3'
require_relative '../lib/standard_board.rb'

RSpec.describe TicTacToe::StandardBoard do
  before :each do
    @db = SQLite3::Database.new(':memory:')
    @db.execute('DROP TABLE IF EXISTS moves')
    @db.execute(
      "CREATE TABLE moves (
        id INTEGER PRIMARY KEY,
        player TEXT,
        position INTEGER
      )"
    )
    @db.results_as_hash = true
  end
  it 'can return an updated board' do
    board = TicTacToe::StandardBoard.new(db: @db)
    @db.execute(
      "INSERT INTO moves ( player, position )
      VALUES ( 'X', 2 ), ( 'O', 4 ), ( 'X', 6 ), ( 'O', 8 )"
    )
    updated_board = board.update
    expected_board = TicTacToe::StandardBoard.new(db: @db, state: [nil, nil, 'X', nil, 'O', nil, 'X', nil, 'O'])

    expect(updated_board.cells).to eq(expected_board.cells)
  end
end
