module TicTacToe
  module Messager
    class << self
      def message(msg, token = nil)
        messages = {
          :turn_prompt => "\nIt is #{token}'s turn.\nSelect any available position:",
          :nan => "\nThat is not a valid integer. Please try again.",
          :not_available => "\nThat is not an available option. Please try again.",
          :game_mode_menu => "Please select a game mode:\n  <1> Human vs. Human\n  <2> Human vs. Computer",
          :player_menu => "Please select a player:\n  <X> Player 1\n  <O> Player 2",
          :winner => "\n#{token} won!",
          :cats_game => "\nCat's game!",
          :continue => "\nEnter <yY> to play again, or anything else to quit.",
          :welcome => "Welcome to Tic Tac Toe!",
          :goodbye => "Goodbye!"
        }
        messages[msg]
      end
    end
  end
end