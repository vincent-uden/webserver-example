class Database
  @db ||= SQLite3::Database.new './database/data.db'

  def self.execute(*args)
     @db.execute *args
  end
end
