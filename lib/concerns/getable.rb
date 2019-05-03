module TicTacToe
  module IO
    module Getable
      class << self
        def get_input
          gets.chomp
        end
      end
    end
  end
end