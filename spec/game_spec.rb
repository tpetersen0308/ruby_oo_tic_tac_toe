require 'spec_helper'

RSpec.describe TicTacToe::Game do
  it 'can execute a turn' do
    player1, player2 = [TicTacToe::HumanPlayer.new("X"), TicTacToe::HumanPlayer.new("O")]
    board = TicTacToe::Board.new(state: ["X", nil, "X", nil, "O", nil, nil, nil, nil])
    game = TicTacToe::Game.new(board, [player2, player1])
    
    allow(player2).to receive(:gets).and_return("2\n")
    
    game = game.turn

    expect(game.board.cells).to eq(["X", "O", "X", nil, "O", nil, nil, nil, nil])
    expect(game.current_player).to eq(player1)
    expect(game.next_player).to eq(player2)
  end

  it 'can execute a turn with invalid input' do
    player1, player2 = [TicTacToe::HumanPlayer.new("X"), TicTacToe::HumanPlayer.new("O")]
    board = TicTacToe::Board.new(state: ["X", nil, "X", nil, "O", nil, nil, nil, nil])
    game = TicTacToe::Game.new(board, [player2, player1])
    
    allow(player2).to receive(:gets).and_return("foo", "3\n", "2\n")
    
    game = game.turn

    expect(game.board.cells).to eq(["X", "O", "X", nil, "O", nil, nil, nil, nil])
    expect(game.current_player).to eq(player1)
    expect(game.next_player).to eq(player2)
  end

  it 'can execute a game' do
    player1, player2 = [TicTacToe::HumanPlayer.new("X"), TicTacToe::HumanPlayer.new("O")]
    board = TicTacToe::Board.new
    game = TicTacToe::Game.new(board, [player1, player2])
    
    allow(player1).to receive(:gets).and_return("1\n", "3\n", "9\n")
    allow(player2).to receive(:gets).and_return("5\n", "2\n", "8\n")
    allow(game).to receive(:puts).and_return("")
    
    game = game.play

    expect(game.board.cells).to eq(["X", "O", "X", nil, "O", nil, nil, "O", "X"])
    expect(game.current_player).to eq(player1)
    expect(game.next_player).to eq(player2)
  end
end