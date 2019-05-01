module TicTacToe::Messageable
  def self.message(msg, token = nil)
    messages = {
      :turn_prompt => "\nIt is #{token}'s turn.\nSelect any available position:",
      :nan => "\nThat is not a valid integer. Please try again.",
      :not_available => "\nThat is not an available option. Please try again.",
      :game_mode_menu => "Please select a game mode:\n  <x/X> Human vs. Human\n  <o/O> Human vs. Computer",
      :player_menu => "Please select a player:\n  <1> Player 1\n  <2> Player 2"
    }
    messages[msg]
  end
end