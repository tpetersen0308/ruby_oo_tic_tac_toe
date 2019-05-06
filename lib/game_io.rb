module TicTacToe
  module IO
    class << self
      def get_input
        gets.chomp
      end

      def print_message(msg)
        puts(msg)
      end
    end
  end
end