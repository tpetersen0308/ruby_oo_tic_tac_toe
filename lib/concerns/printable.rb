module TicTacToe
  module IO
    module Printable
      class << self
        def print_message(msg)
          puts(msg)
        end
      end
    end
  end
end