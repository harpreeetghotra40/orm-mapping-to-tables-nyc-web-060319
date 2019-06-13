require 'sqlite3'
require_relative './song.rb'
require 'pry'

DB = {:conn => SQLite3::Database.new("./music.db")}
class Song
 
    attr_accessor :name, :album, :id
   
    def initialize(name, album, id=nil)
      @id = id
      @name = name
      @album = album
      Song.create_table
    end
   
    def self.create_table
      sql =  <<-SQL 
        CREATE TABLE IF NOT EXISTS songs (
          id INTEGER PRIMARY KEY, 
          name TEXT, 
          album TEXT
          )
          SQL
      DB[:conn].execute(sql) 
    end

    def save
        sql = <<-SQL
          INSERT INTO songs (name, album) 
          VALUES (?, ?)
        SQL
     
        DB[:conn].execute(sql, self.name, self.album)
     
    end
   binding.pry
  end