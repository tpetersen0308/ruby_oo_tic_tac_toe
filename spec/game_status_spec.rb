require 'spec_helper'
require_relative '../lib/game_status.rb'

RSpec.describe TicTacToe::GameStatus do
  [
    [0, 1, 2, "top row"],
    [3, 4, 5, "middle row"],
    [6, 7, 8, "bottom row"],
    [0, 3, 6, "left column"],
    [1, 4, 7, "middle column"],
    [2, 5, 8, "right column"],
    [0, 4, 8, "NW to SE diagonal"],
    [2, 4, 6, "SW to NE diagonal"]
  ].each do |first, second, third, desc|
    it "can check for a #{desc} win" do
      cells = Array.new(9)
      cells[first], cells[second], cells[third] = "X", "X", "X"
      
      expect(TicTacToe::GameStatus.won?(cells)).to eq(true)
    end
  end

  it "returns a falsy value when there is not a win" do
    cells = [nil, nil, "X", nil, "O", nil, "X", nil, nil]

    expect(TicTacToe::GameStatus.won?(cells)).to eq(false)
  end

  it "can check for a cat's game" do
    cells = ["X", "O", "X", "X", "O", "X", "O", "X", "O"]

    expect(TicTacToe::GameStatus.cats_game?(cells)).to eq(true)
  end

  it "can check if the game is over" do
    cells = ["X", "O", nil, "X", "X", nil, "O", "O", "X"]
    expect(TicTacToe::GameStatus.over?(cells)).to eq(true)

    cells = ["X", "O", "X", "X", "O", "X", "O", "X", "O"]
    expect(TicTacToe::GameStatus.over?(cells)).to eq(true)
  end
end