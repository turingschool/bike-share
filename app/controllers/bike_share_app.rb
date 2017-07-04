class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"dashboard"
  end

  get '/stations' do
    @stations = Station.all
    erb :"/stations/index"
  end

  get '/stations/index-2' do
    @stations = Station.all
    erb :"/stations/index-2"
  end

  get '/stations/index-3' do
    @stations = Station.all
    erb :"/stations/index-3"
  end

  get '/stations/new' do
    erb :"/stations/new"
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect :"/stations/#{@station.id}"
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :'/stations/show'
  end

  get '/stations/:id/edit' do |id|
    @station = Station.find(id)
    erb :"/stations/edit"
  end

  put '/stations/:id' do
    @station = Station.update(params[:id], params[:station])
    redirect "/stations/#{@station.id}"
  end

  delete '/stations/:id' do |id|
    @station = Station.destroy(id)
    redirect '/stations'
  end

  get '/station-dashboard' do
    @total_stations = Station.total_count
    @most_bikes_station = Station.station_with_most_bikes
    @fewest_bikes_station = Station.stations_with_fewest_bikes_available
    @average_bikes = Station.average_bikes_available_per_station
    @newest_station = Station.most_recently_installed
    @oldest_station = Station.oldest_station
    @most_bikes = Station.most_number_of_available_bikes
    @least_bikes = Station.least_number_of_available_bikes
    erb :"/stations/dashboard"
  end
end
