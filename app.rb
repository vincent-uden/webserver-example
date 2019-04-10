require_relative 'database/database'

class App < Sinatra::Base
  get '/' do
    slim :index
  end

  get '/meme/:id' do
    @name = Database.execute 'SELECT (name) FROM memes WHERE id = ?', params['id']
    @name = @name[0][0]
    slim :meme
  end
end
