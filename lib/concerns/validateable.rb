module TicTacToe::Validateable
  def self.validate_input(input, valid_options)
    {
      :is_valid => valid_options.include?(input), 
      :msg => input.class == String ? :nan : :not_available
    }
  end
end