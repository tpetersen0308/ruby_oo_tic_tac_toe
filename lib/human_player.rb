module TicTacToe
  class HumanPlayer < Player
    attr_reader :ui
    
    def initialize(token, ui = CONFIG.fetch(:input))
      super(token)
      self.ui = ui
    end

    def move
      ui.get_input
    end

    def human?
      true
    end

    private
      attr_writer :ui
  end
end