require 'will_paginate'
require 'will_paginate/active_record'
require 'pry'

class BikeShareApp < Sinatra::Base

  configure do
    register WillPaginate::Sinatra
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end

  get '/' do
    erb :"home/index"
  end

# Station App

  get '/stations' do
    @stations = Station.all.paginate(:page => params[:page], :per_page => 30)
    erb :"stations/index"
  end

  get '/stations/new' do
    @city = City.new()
    @station = Station.new()
    erb :"stations/new"
  end

  post '/stations/new' do
    @city = City.find_or_create_by(name: params[:city])
    @station = Station.new(params[:station])
    if @station.invalid? || @city.invalid?
      @city.invalid?
      erb :"stations/new"
    else
      @station.save
      @city.stations << @station
      redirect "stations/#{@station.id}"
    end
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    @city = @station.city
    erb :"stations/edit"
  end

  put '/stations/:id' do
    @city = City.find_or_create_by(name: params[:city])
    @station = Station.new(params[:station])

    if @city.invalid? || @station.invalid?
      erb :"stations/edit"
    else
      params[:station][:city_id] = @city.id
      Station.find(params[:id]).update(params[:station])

      redirect "/stations/#{params[:id]}"
    end

  end

  delete '/stations/:id' do
    station = Station.find(params[:id])
    station.destroy
    redirect '/stations'
  end

  get '/station-dashboard' do
    erb :"stations/station-dashboard"
  end 
  
  # Trips App

  get '/trips' do
    @trips = Trip.all.paginate(:page => params[:page], :per_page => 30)
    erb :"trips/index"
  end

  get '/trips/new' do
    # @station = Station.new()
    # @trip = Trip.new()
    erb :"trips/new"
  end

  post '/trips/new' do
    @station = Station.find_or_create_by(name: params[:city])
    @trip = Trip.new(params[:trip])
    if @trip.invalid? || @station.invalid?
      @station.invalid?
      erb :"trips/new"
    else
      @trip.save
      @station.trips << @trip
      redirect "trips/#{@trip.id}"
    end
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    @start_trip_station_name = @trip.start_station_name
    @end_trip_station_name = @trip.end_station_name
    @number_of_rides_started = Trip.number_of_rides_started_at_station(@start_trip_station_name)
    @number_of_rides_ended = Trip.number_of_rides_ended_at_station(@end_trip_station_name)
    @most_frequent_destination = Trip.most_frequent_destination_for_station(@start_trip_station_name)
    @most_frequent_origin = Trip.most_frequent_origin_for_station(@end_trip_station_name)
    @highest_trips_by_date_for_station = Trip.highest_trips_by_date_for_station(@start_trip_station_name)
    @most_frequent_zip = Trip.most_frequent_zipcode_for_start_station(@start_trip_station_name)
    @most_frequent_bike_id_for_start_station = Trip.most_frequent_bike_id_for_start_station(@start_trip_station_name)

    erb :"trips/show"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    @station = @trip.station
    erb :"trips/edit"
  end

  put '/trips/:id' do
    @station = Station.find_or_create_by(name: params[:station])
    @trip = trip.new(params[:trip])

    if @station.invalid? || @trip.invalid?
      erb :"trips/edit"
    else
      params[:trip][:station_id] = @station.id
      Trip.find(params[:id]).update(params[:trip])

      redirect "/trips/#{params[:id]}"
    end

  end

  delete '/trips/:id' do
    trip = Trip.destroy(params[:id])
    redirect '/trips'
  end

  put '/trips/:id' do
    @sub_type = SubscriptionType.find_or_create_by(params["subscription_type"])
    params[:trip]["subscription_type_id"] = @sub_type.id
    @trip = Trip.update(params[:id].to_i, params[:trip])
    redirect '/trips'
    #redirect '/trips/#{@trip.id}' isn't working
  end

  post '/trips' do
    @sub_type = SubscriptionType.find_or_create_by(params["subscription_type"])
    params[:trip]["subscription_type_id"] = @sub_type.id
    @trip = Trip.create(params[:trip])
    redirect '/trips'
  end

  # Conditions App

  get '/conditions/' do
    redirect '/conditions'
  end

  get '/conditions' do
    @conditions = Condition.all.paginate(:page => params[:page], :per_page => 30)
    erb :"conditions/index"
  end

  get '/conditions/new' do
    @city = City.new()
    @condition = Condition.new()

    erb :"conditions/new"
  end

  post '/conditions/new' do
    @city = City.find_or_create_by(name: params[:city])
    @condition = Condition.new(params[:condition])
    if @condition.invalid? || @city.invalid?
      @city.invalid?
      erb :"conditions/new"
    else
      @condition.save
      @city.conditions << @condition
      redirect "conditions/#{@condition.id}"
    end
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    @city = @condition.city
    erb :"conditions/edit"
  end

  put '/conditions/:id' do
    @city = City.find_or_create_by(name: params[:city])
    @condition = Condition.new(params[:station])

    if @city.invalid? || @condition.invalid?
      @condition.invalid?
      erb :"stations/edit"
    else
      params[:condition][:city_id] = @city.id
      Condition.find(params[:id]).update(params[:condition])
      redirect "conditions/#{params[:id]}"
    end
  end

  delete '/conditions/:id' do
    condition = Condition.find(params[:id])
    condition.destroy

    redirect '/conditions'
  end
end
