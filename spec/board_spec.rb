require 'spec_helper'

RSpec.describe TicTacToe::Board do
  it 'initializes with an empty array representing a 3x3 board by default' do
    expect(TicTacToe::Board.new.cells).to eq(Array.new(9))
  end

  it 'initializes with an empty array representing a board of arbitrary row size' do
    expect(TicTacToe::Board.new(row_size: 5).cells).to eq(Array.new(25))
  end

  it 'can initialize with a passed-in state' do
    state = [nil, nil, "X", nil, "O", nil, "X", nil, nil]
    expect(TicTacToe::Board.new(state: state).cells).to eq(state)
  end

  it 'can return an updated board' do
    state = [nil, nil, "X", nil, "O", nil, "X", nil, nil]
    board = TicTacToe::Board.new(state: [nil, nil, "X", nil, "O", nil, "X", nil, nil])
    updated_board = board.update(8, "X")
    expected_board = TicTacToe::Board.new(state: [nil, nil, "X", nil, "O", nil, "X", nil, "X"])
    
    expect(updated_board.cells).to eq(expected_board.cells)
  end

  it 'can tell if it is full' do
    board = TicTacToe::Board.new
    expect(board.full?).to be_falsy

    board = TicTacToe::Board.new(state: ["X","O","X","O","X","O","X","O","X"])
    expect(board.full?).to be_truthy
  end
end