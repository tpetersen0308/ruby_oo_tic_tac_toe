class TicTacToe::HumanPlayer < TicTacToe::Player
  def initialize(token, ui: nil)
    super(token)
    @ui = ui
  end

  def move
    @ui.get_input
  end
end