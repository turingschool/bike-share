require 'pry'
require_relative 'pagination'

class BikeShareApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)

  set :method_override, true

    include Pagination

  get '/' do
    erb :"home/index"
  end

  get '/station-dashboard' do
    @station_count = Station.station_count
    @bike_average = Station.bike_average
    @most_bikes = Station.most_bikes
    @stations_with_most_bikes = Station.top_bikes
    @few_bikes = Station.few_bikes
    @stations_with_fewest_bikes = Station.fewest_bikes
    @newest_station = Station.newest_station
    @oldest_station = Station.oldest_station
    erb :"station/dashboard"
  end

  get '/stations' do
    @stations = Station.all
    erb :"station/index"
  end

  get '/stations/new' do
    erb :"station/new"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end

  post '/stations' do
    @city = City.find_or_create_by(params[:city])
    params[:station]["city_id"] = @city.id
    @station = Station.create(params[:station])
    redirect '/stations'
  end

  post '/conditions' do
    @condition = Condition.create(params[:condition])
    redirect '/conditions'
  end

  get '/stations/:id' do
    id = params[:id]
    @station = Station.find(id)
    erb :"station/show"
  end


  get '/trips' do
    redirect '/trips/page/1'
  end

  get '/trips/page/:num' do |num|
      @trips = page_display(Trip, num.to_i)
      @next_page = next_page(num.to_i, Trip.count)
      @previous_page = previous_page(num.to_i)
      erb :"trip/index"
  end

  get '/conditions' do
    redirect '/conditions/page/1'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"station/edit"
  end



  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :"conditions/edit"
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  put '/stations/:id' do
    @city = City.find_or_create_by(params[:city])
    params[:station][:city_id] = @city.id
    @station = Station.update(params[:id].to_i, params[:station])
    redirect '/stations'
    #redirect '/stations/#{@station.id}' isn't working
  end

  put '/conditions/:id' do
    @condition = Condition.update(params[:id].to_i, params[:condition])
    redirect '/conditions'
  end

  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect '/stations'
  end


  get '/trips/new' do
    erb :"/trip/new"
  end

  post '/trips' do
    @sub_type = SubscriptionType.find_or_create_by(params["subscription_type"])
    params[:trip]["subscription_type_id"] = @sub_type.id
    @trip = Trip.create(params[:trip])
    redirect '/trips'
  end

  delete '/conditions/:id' do
    @condition = Condition.destroy(params[:id])
    redirect '/conditions'
  end

  get '/conditions/page/:num' do |num|
      @conditions = page_display(Condition, num.to_i)
      @next_page = next_page(num.to_i, Condition.count)
      @previous_page = previous_page(num.to_i)
      erb :"conditions/index"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :"trip/edit"
  end

  get '/trips/:id' do
    id = params[:id]
    @trip = Trip.find(id)
    @start_trip_station_name = @trip.start_station_name
    @end_trip_station_name = @trip.end_station_name
    @number_of_rides_started = Trip.number_of_rides_started_at_station(@start_trip_station_name)
    @number_of_rides_ended = Trip.number_of_rides_ended_at_station(@end_trip_station_name)
    @most_frequent_destination = Trip.most_frequent_destination_for_station(@start_trip_station_name)
    @most_frequent_origin = Trip.most_frequent_origin_for_station(@end_trip_station_name)
    @highest_trips_by_date_for_station = Trip.highest_trips_by_date_for_station(@start_trip_station_name)
    @most_frequent_zip = Trip.most_frequent_zipcode_for_start_station(@start_trip_station_name)
    @most_frequent_bike_id_for_start_station = Trip.most_frequent_bike_id_for_start_station(@start_trip_station_name)

    erb :"trip/show"
  end

  get '/weather-dashboard' do

  end

  put '/trips/:id' do
    @sub_type = SubscriptionType.find_or_create_by(params["subscription_type"])
    params[:trip]["subscription_type_id"] = @sub_type.id
    @trip = Trip.update(params[:id].to_i, params[:trip])
    redirect '/trips'
    #redirect '/trips/#{@trip.id}' isn't working
  end

  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect '/trips'
  end

  get '/trips-dashboard' do
    @average_ride_duration = Trip.average_ride_duration
    @longest_ride = Trip.longest_ride
    @shortest_ride = Trip.shortest_ride
    @bike_most_rides = Trip.bike_with_most_rides
    @bike_least_rides = Trip.bike_with_least_rides
    @station_with_most_rides_start = Trip.station_with_most_rides_start_station
    @station_name_most_rides_start = @station_with_most_rides_start.first
    @station_count_most_rides_start = @station_with_most_rides_start.last
    @station_with_most_rides_end = Trip.station_with_most_rides_end_station
    @station_name_most_rides_end = @station_with_most_rides_end.first
    @station_count_most_rides_end = @station_with_most_rides_end.last
    @station_with_most_rides_end = Trip.station_with_most_rides_end_station
    @month_by_month_breakdown = Trip.month_by_month_breakdown(Trip.get_month_set)
    @year_subtotals = Trip.year_subtotals(Trip.get_year_set)
    @date_highest_trips = Trip.date_with_highest_trips
    @date_lowest_trips = Trip.date_with_lowest_trips

    erb :"trip/dashboard"
  end
end
