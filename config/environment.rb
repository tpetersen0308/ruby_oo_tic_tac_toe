require 'bundler'
Bundler.require

require_relative '../lib/tic_tac_toe/models/concerns/tic_tac_toe.rb'
require_relative '../lib/tic_tac_toe/models/concerns/checkable.rb'
require_relative '../lib/tic_tac_toe/models/concerns/formattable.rb'
require_relative '../lib/tic_tac_toe/models/concerns/getable.rb'
require_relative '../lib/tic_tac_toe/models/concerns/printable.rb'
require_relative '../lib/tic_tac_toe/models/board.rb'
require_relative '../lib/tic_tac_toe/models/player.rb'
require_relative '../lib/tic_tac_toe/models/computer_player.rb'
require_relative '../lib/tic_tac_toe/models/human_player.rb'
