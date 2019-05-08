require 'sqlite3'

class MoveDatabase
  def initialize
    self.database = SQLite3::Database.new(':memory:')
    database.execute(
      "CREATE TABLE moves (
      id INTEGER PRIMARY KEY,
      player TEXT,
      position INTEGER)"
    )
    database.results_as_hash = true
    database
  end

  def add_move(token, position)
    database.execute("INSERT INTO moves (player, position) VALUES ('#{token}', #{position})")
  end

  def get_all_moves
    database.execute('SELECT * FROM moves')
  end

  def get_last_n_moves(n)
    database.execute("SELECT * FROM moves ORDER BY id DESC LIMIT #{n}")
  end

  private

  attr_accessor :database
end
