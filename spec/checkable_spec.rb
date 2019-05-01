require 'spec_helper'

class MockCheckableExtender
  extend TicTacToe::Checkable
end

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
      cells = Array.new(9)
      cells[first], cells[second], cells[third] = "X", "X", "X"
      
      expect(MockCheckableExtender.won?(cells)).to eq(true)
    end
  end

  it "returns a falsy value when there is not a win" do
    cells = [nil, nil, "X", nil, "O", nil, "X", nil, nil]

    expect(MockCheckableExtender.won?(cells)).to eq(false)
  end

  it "can check for a cat's game" do
    cells = ["X", "O", "X", "X", "O", "X", "O", "X", "O"]

    expect(MockCheckableExtender.cats_game?(cells)).to eq(true)
  end

  it "can check if the game is over" do
    cells = ["X", "O", nil, "X", "X", nil, "O", "O", "X"]
    expect(MockCheckableExtender.over?(cells)).to eq(true)

    cells = ["X", "O", "X", "X", "O", "X", "O", "X", "O"]
    expect(MockCheckableExtender.over?(cells)).to eq(true)
  end

  it 'can return an array of available positions' do
    cells = [nil, nil, "X", nil, "O", nil, "X", nil, nil]

    expect(MockCheckableExtender.available_cells(cells)).to eq([0,1,3,5,7,8])
  end
end