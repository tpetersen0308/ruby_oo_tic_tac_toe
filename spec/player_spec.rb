require 'spec_helper'
require_relative '../lib/player.rb'

RSpec.describe TicTacToe::Player do
  it 'initializes with a token' do
    expect(TicTacToe::Player.new("X").token).to eq("X")
  end
end