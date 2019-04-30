require 'spec_helper'

RSpec.describe TicTacToe::Player do
  it 'initializes with a token' do
    expect(TicTacToe::Player.new("X").token).to eq("X")
  end
end