require 'spec_helper'
require_relative '../lib/human_player.rb'
require_relative '../lib/game_io.rb'

RSpec.describe TicTacToe::HumanPlayer do
  it 'initializes with a token' do
    expect(TicTacToe::HumanPlayer.new('X').token).to eq('X')
  end

  it 'can make a move' do
    player = TicTacToe::HumanPlayer.new('X')
    available_positions = %w[1 4 8 9]
    allow(TicTacToe::GameIO).to receive(:get_input).and_return('4')
    expect(player.move(available_positions)).to eq('4')
  end
end
