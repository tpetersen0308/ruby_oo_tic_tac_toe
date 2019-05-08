require 'bundler'
Bundler.require

require_relative '../lib/tic_tac_toe.rb'

DB = { conn: SQLite3::Database.new(':memory:') }.freeze

sql = <<-SQL
  CREATE TABLE moves (
    id INTEGER PRIMARY KEY,
    player TEXT,
    position INTEGER
  )
SQL

DB[:conn].execute(sql)
DB[:conn].results_as_hash = true
