require 'spec_helper'

RSpec.describe TicTacToe::Setupable do
  before(:each) do
    @option_selector = TicTacToe::CONFIG.fetch(:option_selector) 
    @messager = TicTacToe::CONFIG.fetch(:messager) 
    @game_mode_options = TicTacToe::CONFIG.fetch(:game_mode_options) 
    @game = TicTacToe::CONFIG.fetch(:game) 
    @board = TicTacToe::CONFIG.fetch(:board) 
    @player_options = TicTacToe::CONFIG.fetch(:player_options) 
    @players = TicTacToe::CONFIG.fetch(:players)
  end
  
  it 'can set up a new human vs human game' do
    allow(TicTacToe::CONFIG.fetch(:input)).to receive(:gets).and_return("foo", "3\n", "1\n")

    game = TicTacToe::Setupable.new_game(@option_selector, @messager, @game_mode_options, @game, @board, @player_options, @players)
    expect(game.current_player.class).to eq(TicTacToe::HumanPlayer)
    expect(game.next_player.class).to eq(TicTacToe::HumanPlayer)
    expect(game.board.cells).to eq(Array.new(9))
  end
  
  it 'can set up a new human vs computer game' do
    allow(TicTacToe::CONFIG.fetch(:input)).to receive(:gets).and_return("foo", "3\n", "2\n", "1\n", "foo", "o\n")

    game = TicTacToe::Setupable.new_game(@option_selector, @messager, @game_mode_options, @game, @board, @player_options, @players)
    expect(game.current_player.class).to eq(TicTacToe::ComputerPlayer)
    expect(game.next_player.class).to eq(TicTacToe::HumanPlayer)
    expect(game.board.cells).to eq(Array.new(9))
  end
end