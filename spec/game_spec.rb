require 'spec_helper'

RSpec.describe TicTacToe::Game do
  before(:each) do
    @input = TicTacToe::IO::Getable
    @output = TicTacToe::IO::Printable
    @human = TicTacToe::HumanPlayer
    @board = TicTacToe::Board
    @game_modules = {
      game_status: TicTacToe::Checkable,
      validator: TicTacToe::Validateable,
      output: TicTacToe::IO::Printable,
      messager: TicTacToe::Messageable,
    }
  end

  describe "Human vs. Human game" do
    before(:each) do
      @player1 = @human.new("X", ui: @input)
      @player2 = @human.new("O", ui: @input)
    end
  
    it 'can execute a turn' do
      board = @board.new(state: ["X", nil, "X", nil, "O", nil, nil, nil, nil])
      game = TicTacToe::Game.new(board, [@player2, @player1], @game_modules)
      
      allow(@input).to receive(:gets).and_return("2\n")
      
      game = game.turn
  
      expect(game.board.cells).to eq(["X", "O", "X", nil, "O", nil, nil, nil, nil])
      expect(game.current_player).to eq(@player1)
      expect(game.next_player).to eq(@player2)
    end
  
    it 'can execute a turn with invalid input' do
      board = @board.new(state: ["X", nil, "X", nil, "O", nil, nil, nil, nil])
      game = TicTacToe::Game.new(board, [@player2, @player1], @game_modules)
      
      allow(@input).to receive(:gets).and_return("foo", "3\n", "2\n")
      
      game = game.turn
  
      expect(game.board.cells).to eq(["X", "O", "X", nil, "O", nil, nil, nil, nil])
      expect(game.current_player).to eq(@player1)
      expect(game.next_player).to eq(@player2)
    end
  
    it 'can execute a game' do
      board = @board.new
      game = TicTacToe::Game.new(board, [@player1, @player2], @game_modules)
      
      allow(@input).to receive(:gets).and_return("1\n", "5\n", "3\n", "2\n", "9\n", "8\n")
      allow(game).to receive(:puts).and_return("")
      
      game = game.play
  
      expect(game.board.cells).to eq(["X", "O", "X", nil, "O", nil, nil, "O", "X"])
      expect(game.current_player).to eq(@player1)
      expect(game.next_player).to eq(@player2)
    end
  end

  describe "Human vs. Computer game" do
    before(:each) do
      @player1 = @human.new("X", ui: @input)
      @player2 = TicTacToe::ComputerPlayer.new("O")
    end

    it 'can execute a turn' do
      board = @board.new(state: ["X", nil, "X", nil, "O", nil, nil, nil, nil])
      game = TicTacToe::Game.new(board, [@player2, @player1], @game_modules)
      
      allow(@player2).to receive(:move).and_return(1)
      
      game = game.turn
  
      expect(game.board.cells).to eq(["X", "O", "X", nil, "O", nil, nil, nil, nil])
      expect(game.current_player).to eq(@player1)
      expect(game.next_player).to eq(@player2)
    end

    it 'can execute a game' do
      board = @board.new
      game = TicTacToe::Game.new(board, [@player1, @player2], @game_modules)
      
      allow(@input).to receive(:gets).and_return("1\n", "foo", "5\n", "3\n", "bar", "9\n")
      allow(@player2).to receive(:move).and_return(4, 1, 7)
      allow(game).to receive(:puts).and_return("")
      
      game = game.play
  
      expect(game.board.cells).to eq(["X", "O", "X", nil, "O", nil, nil, "O", "X"])
      expect(game.current_player).to eq(@player1)
      expect(game.next_player).to eq(@player2)
    end
  end
end