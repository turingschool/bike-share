require 'pry'

class BikeShareApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  set :method_override, true

  get '/trips' do
    @trips = Trip.paginate(:page => params[:page], :per_page => 30)
    erb :"trips/trip_index"
  end

  get '/trips/dashboard' do
    erb :"trips/trips_dashboard"
  end

  get '/trips/new' do
    erb :"trips/trip_new"
  end


  post '/trips' do
    trip = Trip.find_or_create_by(
    duration: params[:duration],
    start_station: params[:start_station],
    end_station: params[:end_station],
    trip_date: Date.strptime(params[:trip_date], "%m/%d/%Y"),
    bike_id: params[:bike_id],
    subscription_type: SubscriptionType.find_or_create_by(subscription_type:
    params[:subscription_type]),
    zip_code: ZipCode.find_or_create_by(zip_code: params[:zip_code])
    )

    redirect"/trips/#{trip.id}"
  end


  get '/trips/:id' do
    @trip = Trip.find(params["id"])
    erb :"trips/show_trip"

  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params["id"])
    erb :"trips/trip_edit"
  end

  put '/trips/:id/edit' do
    Trip.update(
    params[:id],
    duration: params[:duration],
    start_station: params[:start_station],
    end_station: params[:end_station],
    trip_date: Date.strptime(params[:trip_date], "%Y-%d-%m"),
    bike_id: params[:bike_id],
    subscription_type: SubscriptionType.find_or_create_by(subscription_type: params[:subscription_type]),
    zip_code: ZipCode.find_or_create_by(zip_code: params[:zip_code])
    )

    redirect "/trips/#{params[:id]}"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])
    redirect "/trips"
  end

  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.paginate(:page => params[:page], :per_page => 30)
    erb :'stations/index'
  end

  get '/stations/new' do
    @cities = City.all
    erb :'stations/new'
  end

  get '/stations-dashboard' do
    @stations = Station.all
    erb :'stations/dashboard'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  post '/stations' do
    city_name = params["city"]
    city = City.find_or_create_by(city: city_name)
    station = Station.create(params["station"])
    redirect "/stations/#{station.id}"
  end

  get '/stations/:id/edit' do |id|
    @station = Station.find(id)
    @cities = City.all
    erb :"stations/edit"
  end

  put '/stations/:id' do |id|
    @station = Station.find(id)
    city_name = params["city"]
    city = City.find_or_create_by(city: city_name)
    @station.update(params["station"])
    @station.update(city_id: city.id)
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.delete(id)
    redirect '/stations'
  end

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

  get '/conditions-dashboard' do
    @by_max_temp = Weather.find_max_temp_increment
    @by_precipitation = Weather.find_precipitation_increment
    @by_wind_speed = Weather.find_wind_speed_increment
    @by_visibility = Weather.find_visibility_increment
    @highest = Weather.highest_rides_weather
    @fewest = Weather.fewest_rides_weather
    erb :"conditions/weather_dashboard"
  end

  get '/conditions' do
    @conditions = Weather.all
    erb :"conditions/weather_index"
  end

  get '/conditons.new' do
    erb :"conditions/new_weather"
  end

  get '/conditions/:id' do
    @condition = Weather.find(params["id"])
    erb :"conditions/show_weather"
  end

  get '/conditions/:id/edit' do
    @condition = Weather.find(params["id"])
    erb :"conditions/edit_weather"
  end

  post '/conditions' do
    @condition = Weather.create(params)
    redirect '/conditions'
  end

  delete '/conditions/:id' do
    Weather.delete(params["id"])
    redirect '/conditions'
  end
end
