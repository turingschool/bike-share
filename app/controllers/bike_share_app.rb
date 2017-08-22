class BikeShareApp < Sinatra::Base

  get '/trips' do
    @trips = Trip.all
    erb :trip_index
  end


  post '/trips' do
    @trip = Trip.new(params)
    trip.save
    redirect'/trips'
  end

  get '/trips/new' do
    erb :trip_new
  end


  get '/trips/:id' do
    @trip = Trip.find(params["id"])
    erb :show_trip

  end

  get '/trips/:id/edit' do
    erb :trip_edit
  end

  get 'station-dashboard' do
    @total_stations = Station.count
    erb :station_dashboard
  end

  get '/conditions' do
    @conditions = Weather.all
    erb :weather_dashboard
  end

  get '/conditons.new' do
    erb :new_weather
  end

  get '/conditions/:id' do
    @condition = Weather.find(params["id"])
    erb :show_weather
  end

  get '/conditions/:id/edit' do
    @condition = Weather.find(params["id"])
    erb :edit_weather
  end

  post '/conditions' do
    @condition = Weather.new(params)
    condition.save
    redirect '/conditions'
  end

  delete '/conditions/:id' do
    Weather.delete(params["id"])
    redirect '/conditions'
  end
end
