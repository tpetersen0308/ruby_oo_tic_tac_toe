class TicTacToe::HumanPlayer < TicTacToe::Player
  include TicTacToe::IO::Getable
  
  def initialize(token)
    super(token)
  end

  def move
    get_move
  end

  def human?
    true
  end
end