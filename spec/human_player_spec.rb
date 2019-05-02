require 'spec_helper'

RSpec.describe TicTacToe::HumanPlayer do
  it 'initializes with a token' do
    expect(TicTacToe::HumanPlayer.new("X").token).to eq("X")
  end

  it 'can make a move' do
    player = TicTacToe::HumanPlayer.new("X")
    board_cells = Array.new(9)
    allow(TicTacToe::IO::Getable).to receive(:gets).and_return("4\n")
    expect(player.move(board_cells)).to eq(3)
  end
end