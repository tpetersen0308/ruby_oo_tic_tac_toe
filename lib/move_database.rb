require 'sqlite3'

module TicTacToe
  class MoveDatabase
    def initialize
      self.database = SQLite3::Database.new(':memory:')
      create_database
    end

    def create_database
      database.execute(
        "CREATE TABLE moves (
        id INTEGER PRIMARY KEY,
        player TEXT,
        position INTEGER)"
      )
      database.results_as_hash = true
    end

    def add_move(token, position)
      database.execute("INSERT INTO moves (player, position) VALUES ('#{token}', #{position})")
    end

    def all_moves
      database.execute('SELECT * FROM moves')
    end

    def last_n_moves(n)
      database.execute("SELECT * FROM moves ORDER BY id DESC LIMIT #{n}")
    end

    private

    attr_accessor :database
  end
end
