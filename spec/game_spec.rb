require 'spec_helper'
require_relative '../lib/game.rb'
require_relative '../lib/game_io.rb'
require_relative '../lib/human_player.rb'
require_relative '../lib/computer_player.rb'
require_relative '../lib/standard_board.rb'
require_relative '../lib/lite_board.rb'
require_relative '../lib/move_database.rb'

RSpec.describe TicTacToe::Game do
  before(:each) do
    @game_io = TicTacToe::GameIO
    @human = TicTacToe::HumanPlayer
    @standard_board = TicTacToe::StandardBoard
    @lite_board = TicTacToe::LiteBoard
    @db = MoveDatabase.new
  end

  describe 'Human vs. Human game' do
    before(:each) do
      @player1 = @human.new('X')
      @player2 = @human.new('O')
    end

    it 'can execute a turn' do
      board = @standard_board.new(db: @db)
      @db.add_move('X', 0)
      @db.add_move('O', 4)
      @db.add_move('X', 2)
      game = TicTacToe::Game.new(board, [@player2, @player1], @db)

      allow(@game_io).to receive(:gets).and_return("2\n")

      board = game.turn

      expect(board.cells).to eq(['X', 'O', 'X', nil, 'O', nil, nil, nil, nil])
    end

    it 'can execute a game' do
      board = @standard_board.new(db: @db)
      game = TicTacToe::Game.new(board, [@player1, @player2], @db)

      allow(@game_io).to receive(:gets).and_return("1\n", "5\n", "5\n", "3\n", "2\n", "9\n", "8\n")
      allow(game).to receive(:puts).and_return('')

      game = game.play

      expect(game.board.cells).to eq(['X', 'O', 'X', nil, 'O', nil, nil, 'O', 'X'])
      expect(game.current_player).to eq(@player1)
      expect(game.next_player).to eq(@player2)
    end

    it 'can execute a game with Lite3 rules' do
      board = @lite_board.new(db: @db)
      game = TicTacToe::Game.new(board, [@player1, @player2], @db)

      allow(@game_io).to receive(:gets).and_return("1\n", "3\n", "7\n", "4\n", "9\n", "8\n", "5\n", "1\n", "6\n", "7\n", "4\n")
      allow(game).to receive(:puts).and_return('')

      game = game.play

      expect(game.board.cells).to eq(['O', nil, nil, 'X', 'X', 'X', 'O', 'O', nil])
      expect(game.current_player).to eq(@player2)
      expect(game.next_player).to eq(@player1)
    end
  end

  describe 'Human vs. Computer game' do
    before(:each) do
      @player1 = @human.new('X')
      @player2 = TicTacToe::ComputerPlayer.new('O')
    end

    it 'can execute a turn' do
      board = @standard_board.new(db: @db)
      @db.add_move('X', 0)
      @db.add_move('O', 4)
      @db.add_move('X', 2)
      game = TicTacToe::Game.new(board, [@player2, @player1], @db)

      allow(@player2).to receive(:move).and_return(1)

      board = game.turn

      expect(board.cells).to eq(['X', 'O', 'X', nil, 'O', nil, nil, nil, nil])
    end

    it 'can execute a game' do
      board = @standard_board.new(db: @db)
      game = TicTacToe::Game.new(board, [@player1, @player2], @db)

      allow(@game_io).to receive(:gets).and_return("1\n", 'foo', "5\n", "3\n", 'bar', "9\n")
      allow(@player2).to receive(:move).and_return('5', '2', '8')
      allow(game).to receive(:puts).and_return('')

      game = game.play

      expect(game.board.cells).to eq(['X', 'O', 'X', nil, 'O', nil, nil, 'O', 'X'])
      expect(game.current_player).to eq(@player1)
      expect(game.next_player).to eq(@player2)
    end
  end
end
