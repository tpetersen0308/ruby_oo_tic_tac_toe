require 'spec_helper'
require_relative '../lib/computer_player.rb'

RSpec.describe TicTacToe::ComputerPlayer do
  it 'initializes with a token' do
    expect(TicTacToe::ComputerPlayer.new("O").token).to eq("O")
  end

  it 'can select an available space on the board' do
    board_cells = ["X", nil, "X", nil, "O", nil, nil, nil, "O"]
    player = TicTacToe::ComputerPlayer.new("X")
    expect([1, 3, 5, 6, 7]).to include(player.move(board_cells))
  end
end