class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :bike_share
  end

  get '/stations' do
    erb :stations
  end

  get '/stations/all' do
    @stations = Station.all
    erb :all
  end

  get 'stations/new' do
    erb :new
  end

end
