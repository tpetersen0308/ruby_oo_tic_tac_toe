require 'spec_helper'

RSpec.describe TicTacToe::Checkable do
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
      board = Array.new(9)
      board[first], board[second], board[third] = "X", "X", "X"
      
      expect(TicTacToe::Checkable.won?(board)).to be_truthy
    end
  end

  it "returns a falsy value when there is not a win" do
    board = [nil, nil, "X", nil, "O", nil, "X", nil, nil]

    expect(TicTacToe::Checkable.won?(board)).to be_falsy
  end

  it "can check for a cat's game" do
    board = ["X", "O", "X", "X", "O", "X", "O", "X", "O"]
    
    expect(TicTacToe::Checkable.cats_game?(board)).to be_truthy
  end
end