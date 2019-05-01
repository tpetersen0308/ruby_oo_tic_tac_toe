module TicTacToe::Messageable
  def self.message(msg, token = nil)
    messages = {
      :turn_prompt => "\nIt is #{token}'s turn.\nSelect any available position:",
      :nan => "\nThat is not a valid integer. Please try again.",
      :not_available => "\nThat is not an available position. Please try again.",
    }
    messages[msg]
  end
end