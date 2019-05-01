class TicTacToe::HumanPlayer < TicTacToe::Player
  def initialize(token, ui: nil)
    super(token)
    @ui = ui
  end

  def move
    @ui.get_move
  end

  def human?
    true
  end
end