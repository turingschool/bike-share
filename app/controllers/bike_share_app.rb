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


  get '/stations/new' do
    erb :new
  end

  post '/stations' do
    station = Station.new(params)
    station.save
    redirect '/stations'

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
