class BikeShareApp < Sinatra::Base

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
