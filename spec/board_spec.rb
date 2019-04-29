require 'spec_helper'

RSpec.describe Board do
  it 'initializes with an empty array representing a 3x3 board by default' do
    expect(Board.new.cells).to eq(Array.new(9))
  end

  it 'initializes with an empty array representing a board of arbitrary row size' do
    expect(Board.new(5).cells).to eq(Array.new(25))
  end
end