class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/stations' do
    erb :stations
  end

  get '/stations/all' do
    @stations = Station.all
    erb :all
  end

  get '/station_dashboard' do
    @stations = Station.all
    erb :station_dashboard
  end

  get '/trips' do
    @trips = Trip.all
    erb :'/trips/index.erb'
  end

  get '/trips/:id' do
    @trip = Trip.find(id)
    erb :'/trips/show.erb'
  end

  get 'trips/new' do
    erb :'/trips/new.erb'
  end
end
