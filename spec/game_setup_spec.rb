require 'spec_helper'
require_relative '../lib/game_setup.rb'
require_relative '../lib/game_io.rb'

RSpec.describe TicTacToe::GameSetup do
  it 'can set up a new human vs human game' do
    allow(TicTacToe::GameIO).to receive(:get_input).and_return('1', 'foo', '3', '1')

    game = TicTacToe::GameSetup.new_game
    expect(game.current_player.class).to eq(TicTacToe::HumanPlayer)
    expect(game.next_player.class).to eq(TicTacToe::HumanPlayer)
    expect(game.board.cells).to eq(Array.new(9))
  end

  it 'can set up a new human vs computer game' do
    allow(TicTacToe::GameIO).to receive(:get_input).and_return('1', 'foo', '3', '2', '1', 'foo', 'o')

    game = TicTacToe::GameSetup.new_game
    expect(game.current_player.class).to eq(TicTacToe::ComputerPlayer)
    expect(game.next_player.class).to eq(TicTacToe::HumanPlayer)
    expect(game.board.cells).to eq(Array.new(9))
  end

  it 'can set up a new Lite 3 game' do
    allow(TicTacToe::GameIO).to receive(:get_input).and_return('bar', '2', 'foo', '3', '2', '1', 'foo', 'o')

    game = TicTacToe::GameSetup.new_game
    expect(game.current_player.class).to eq(TicTacToe::ComputerPlayer)
    expect(game.next_player.class).to eq(TicTacToe::HumanPlayer)
    expect(game.board.class).to eq(TicTacToe::LiteBoard)
  end
end
