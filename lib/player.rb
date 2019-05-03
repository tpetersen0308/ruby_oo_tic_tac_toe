module TicTacToe
  class Player 
    attr_reader :token

    def initialize(token)
      self.token = token
    end

    private
    
    attr_writer :token
  end
end