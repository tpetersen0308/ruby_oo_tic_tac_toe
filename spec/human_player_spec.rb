require 'spec_helper'

module MockUI
  def self.get_input
    4
  end
end

RSpec.describe TicTacToe::HumanPlayer do
  it 'initializes with a token' do
    expect(TicTacToe::HumanPlayer.new("X").token).to eq("X")
  end

  it 'can make a move' do
    expect(TicTacToe::HumanPlayer.new("X", ui: MockUI).move).to eq(4)
  end
end