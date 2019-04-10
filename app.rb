require_relative 'database/database'

class App < Sinatra::Base
  get '/' do
    # updating the amount of views the index site has had
    views = Database.execute 'SELECT (views) FROM views WHERE name = ?', 'index'
    views = views[0][0]
    views += 1
    Database.execute 'UPDATE views SET views = ? WHERE name = "index"', views
    # parse slim and send html to client
    slim :index
  end

  get '/meme/:id' do
    # get rows from database and extract the name which is used in the slim file
    @name = Database.execute 'SELECT (name) FROM memes WHERE id = ?', params['id']
    @name = @name[0][0]
    slim :meme
  end

  get '/views/:name' do
    # find the amount of views for a site and return it to the client as a string
    views = Database.execute 'SELECT (views) FROM views WHERE name = ?', params['name']
    views[0][0].to_s
  end
end
