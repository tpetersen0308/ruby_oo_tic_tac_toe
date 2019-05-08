require 'spec_helper'
require 'sqlite3'
require_relative '../lib/lite_board.rb'

RSpec.describe TicTacToe::LiteBoard do
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
  it "only returns board with each player's three latest moves" do
    board = TicTacToe::LiteBoard.new(db: @db)
    @db.execute(
      "INSERT INTO moves ( player, position )
      VALUES ( 'X', 0 ), ( 'O', 2 ), ( 'X', 6 ), ( 'O', 3 ), ( 'X', 8 ), ( 'O', 7 ), ( 'X', 4 )"
    )
    updated_board = board.update
    expected_board = TicTacToe::LiteBoard.new(db: @db, state: [nil, nil, 'O', 'O', 'X', nil, 'X', 'O', 'X'])

    expect(updated_board.cells).to eq(expected_board.cells)
  end
end
