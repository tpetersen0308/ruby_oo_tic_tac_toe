module TicTacToe
  class HumanPlayer < Player
    attr_reader :ui
    
    def initialize(token, ui: nil)
      super(token)
      @ui = ui
    end

    def move
      ui.get_input
    end

    def human?
      true
    end
  end
end