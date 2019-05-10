require 'spec_helper'
require_relative '../lib/board.rb'

RSpec.describe TicTacToe::Board do
  it 'initializes with an empty array representing a 3x3 board by default' do
    expect(TicTacToe::Board.new.cells).to eq(Array.new(9))
  end

  it 'initializes with an empty array representing a board of arbitrary row size' do
    expect(TicTacToe::Board.new(row_size: 5).cells).to eq(Array.new(25))
  end

  it 'can initialize with a passed-in state' do
    state = [nil, nil, 'X', nil, 'O', nil, 'X', nil, nil]
    expect(TicTacToe::Board.new(state: state).cells).to eq(state)
  end

  it 'can tell if it is full' do
    board = TicTacToe::Board.new
    expect(board.full?).to eq(false)

    board = TicTacToe::Board.new(state: %w[X O X O X O X O X])
    expect(board.full?).to eq(true)
  end

  it 'can return an array of available moves' do
    board = TicTacToe::Board.new(state: [nil, nil, 'X', nil, 'O', nil, 'X', nil, nil])

    expect(board.available_positions).to eq([0, 1, 3, 5, 7, 8])
  end
end
