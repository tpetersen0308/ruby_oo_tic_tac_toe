require 'spec_helper'

class SetupableExtender
  extend TicTacToe::Setupable
end

RSpec.describe TicTacToe::Setupable do
  before(:each) do
    @config = {
      :players => {
        :human => TicTacToe::HumanPlayer,
        :computer => TicTacToe::ComputerPlayer,
      },
      :board => TicTacToe::Board,
      :game => TicTacToe::Game,
      :validator => TicTacToe::Validateable,
      :messager => TicTacToe::Messageable,
      :input => TicTacToe::IO::Getable,
      :output => TicTacToe::IO::Printable,
      :game_mode_options => {
        :human_v_human => "1",
        :human_v_computer => "2",
      },
      :player_options => {
        :player1 => "X",
        :player2 => "O",
      }
    }
  end
  
  it 'can set up a new human vs human game' do
    allow(@config[:input]).to receive(:gets).and_return("foo", "3\n", "1\n")

    game = SetupableExtender.new_game(@config)
    expect(game.current_player.class).to eq(TicTacToe::HumanPlayer)
    expect(game.next_player.class).to eq(TicTacToe::HumanPlayer)
    expect(game.board.cells).to eq(Array.new(9))
  end
  
  it 'can set up a new human vs computer game' do
    allow(@config[:input]).to receive(:gets).and_return("foo", "3\n", "2\n", "1\n", "foo", "o\n")

    game = SetupableExtender.new_game(@config)
    expect(game.current_player.class).to eq(TicTacToe::ComputerPlayer)
    expect(game.next_player.class).to eq(TicTacToe::HumanPlayer)
    expect(game.board.cells).to eq(Array.new(9))
  end
end