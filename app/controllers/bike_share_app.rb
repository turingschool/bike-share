class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/stations' do
    @stations = Station.all
    erb :index
  end

  get '/station-dashboard' do
    @station_count = Station.count
    @bike_average = Station.average(:dock_count)
    @bike_maximum = Station.maximum(:dock_count)
    @big_stations = Station.where(:dock_count => @bike_maximum)
    @bike_minimum = Station.minimum(:dock_count)
    @small_stations = Station.where(:dock_count => @bike_minimum)
    @new_station = Station.find_by(:installation_date => Station.maximum(:installation_date))
    @old_station = Station.find_by(:installation_date => Station.minimum(:installation_date))

    erb :station_index
  end

  get '/stations/new' do
    erb :new
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :show
  end

  post '/stations' do
    new_city = City.create(name: params[:station][:city])
    new_station = Station.new(name: params[:station][:name],
                              dock_count: params[:station][:dock_count],
                              installation_date: DateTime.strptime((params[:station][:installation_date]), "%Y-%m-%d"))
    new_station.city = City.duplicate(new_city)
    new_station.save

    redirect '/stations'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :edit
  end

  put '/stations/:id' do |id|
    station_update = Station.update(id.to_i, params[:station])
    City.update(station_update.city_id, params[:city])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end
end
