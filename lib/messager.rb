module TicTacToe
  module Messager
    class << self
      def get_message(msg, token = nil)
        messages = {
          turn_prompt: "\nIt is #{token}'s turn.\nSelect any available position:",
          not_available: "\nThat is not an available option. Please try again:",
          player_mode_menu: "\nPlease select a game mode:\n  <1> Human vs. Human\n  <2> Human vs. Computer",
          player_menu: "Please select a player:\n  <X> Player 1\n  <O> Player 2",
          winner: "\n#{token} won!",
          cats_game: "\nCat's game!",
          continue: "\nEnter <yY> to play again, or anything else to quit.",
          welcome: "\nWelcome to Tic Tac Toe!",
          goodbye: 'Goodbye!'
        }
        messages[msg]
      end
    end
  end
end
