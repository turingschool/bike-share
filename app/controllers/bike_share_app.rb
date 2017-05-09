require 'will_paginate'
require 'will_paginate/active_record'
require 'pry'

class BikeShareApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  set :method_override, true

  get '/' do
     erb :dashboard
  end

  get '/stations' do
    erb :"stations/index"
  end

  get '/stations/new' do
    @cities = City.all
    erb :"stations/new"
  end

  post '/stations' do
    city = City.find_by name: params[:city][:name]
    station = city.stations.create(params[:station])
    redirect "/stations/#{station.id}"
  end

  get '/stations/view_all' do
    @stations = Station.all.paginate(:page => params[:page], :per_page => 30)
    erb :"stations/view_all"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    @cities = City.all
    erb :"stations/edit"
  end

  put '/stations/:id' do |id|
    @station = Station.find(params[:id])
    @station.update(params[:station])
    @station.update_city_id(params[:city][:name], @station)
    # city = City.find_by name: params[:city]["name"]
    # Station.find(params:id]).update(city_id: city.id)
    redirect "stations/#{@station.id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect "/stations/view_all"
  end

  get '/station-dashboard' do
    @stations = Station.all
    erb :"station-dashboard"
  end

  get '/trips' do
    erb :"trips/index"
  end

  get '/trips/view_all' do
    @trips = Trip.all.paginate(:page => params[:page], :per_page => 30)
    erb :"trips/view_all"
  end

  get '/trips/new' do
    @start_stations = StartStation.all
    @end_stations = EndStation.all
    @subscription_types = SubscriptionType.all
    erb :"trips/new"
  end

  get '/trips/:id/edit' do
    @stations = Station.all
    @subscription_types = SubscriptionType.all
    @start_stations = StartStation.all
    @end_stations = EndStation.all
    @trip = Trip.find(params[:id])
    erb :"/trips/edit"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  put '/trips/:id' do |id|
    # @start_stations = StartStation.all
    # @end_stations = EndStation.all
    # @subscription_type = SubscriptionType.all
    @trip = Trip.find(params[:id])
    @trip.update(params[:trip])
    redirect "trips/#{@trip.id}"
  end

  post '/trips' do
    subscription_type = SubscriptionType.find_by(name: params[:subscription_type][:name])
    trip_details = params[:trip]
    start_d = trip_details[:start_date].split("-")
    end_d   = trip_details[:end_date].split("-")
    trip_details[:start_date] = RideDate.create(day: start_d[2].to_i, month: start_d[1].to_i, year: start_d[0].to_i)
    trip_details[:end_date] = RideDate.create(day: end_d[2].to_i, month: end_d[1].to_i, year: end_d[0].to_i)

    @trip = subscription_type.trips.create(trip_details)

    redirect "/trips/#{@trip.id}"
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id.to_i)
    redirect "/trips/view_all"
  end

  get '/trips-dashboard' do
    @subscription_types = SubscriptionType.all
    @ride_date = RideDate.all
    @trips = Trip.all
    @start_stations = StartStation.all
    @end_stations = EndStation.all
    erb :"trips-dashboard"
  end
end
