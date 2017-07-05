require "pry"

class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"dashboard"
  end

  get '/stations' do
    @stations = Station.all
    erb :"/stations/index"
  end

  get '/stations/new' do
    erb :"/stations/new"
  end

  post '/stations' do
    date = params[:station][:installation_date_id]
    params[:station][:installation_date_id] = BikeShareDate.create_by_date(date)
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
    date = params[:station][:installation_date_id]
    params[:station][:installation_date_id] = BikeShareDate.create_by_date(date)
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

  get "/trips" do
    @trips = Trip.all
    erb :"/trips/index"
  end

  get '/trips/new' do
    @stations = Station.all
    erb :'/trips/new'
  end

  get '/trips/:id' do |id|
    @trip = Trip.find(id)
    erb :'/trips/show'
  end

  get '/trips/:id/edit' do |id|
    @trip = Trip.find(id)
    @stations = Station.all
    @bikes = Trip.pluck(:bike_id)
    erb :"/trips/edit"
  end

  # trip[duration]:5
  # trip[start_date_id]:2014-01-01
  # trip[end_date_id]:2014-01-02
  # trip[start_station_id]:71
  # trip[end_station_id]:72
  # trip[bike_id]:2
  # trip[subscription_type]:User
  # trip[zipcode_id]:90202
  put "/trips/:id" do |id|
    end_date = params[:trip][:end_date_id]
    params[:trip][:end_date_id] = BikeShareDate.create_by_date(end_date)
    start_date = params[:trip][:start_date_id]
    params[:trip][:start_date_id] = BikeShareDate.create_by_date(start_date)

    zipcode_id = params[:trip][:zipcode_id]
    params[:trip][:zipcode_id] = Zipcode.create_zipcode(zipcode_id)

    @trip = Trip.update(params[:trip])
    redirect "/trips/#{id}"
  end

  # trip[duration]:5
  # trip[start_date_id]:2014-01-02
  # trip[start_station_id]:71
  # trip[end_date_id]:2014-01-03
  # trip[end_station_id]:72
  # trip[bike_id]:1
  # trip[subscription_type]:User
  # trip[zipcode_id]:90202
  post '/trips' do
    start_date = params[:trip][:start_date_id]
    params[:trip][:start_date_id] = BikeShareDate.create_by_date(start_date)

    end_date = params[:trip][:end_date_id]
    params[:trip][:end_date_id] = BikeShareDate.create_by_date(end_date)

    zipcode = params[:trip][:zipcode_id]
    params[:trip][:zipcode_id] = Zipcode.create_zipcode(zipcode)

    Trip.create(params[:trip])

    redirect('/trips')
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id)
    redirect('/trips')
  end
end
