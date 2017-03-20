require 'will_paginate'
require 'will_paginate/active_record'
require 'pry'

class BikeShareApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  get '/' do
    erb :index
  end

  get '/stations' do
    @stations = Station.all.paginate(:page => params[:page], :per_page => 5)

    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  post '/stations' do
    City.create(params[:city])
    ci = City.find_by(params[:city]).id
    params[:station][:city_id] = ci
    Station.create(params[:station])
    redirect "/stations"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'stations/edit'
  end

  put '/stations/:id' do
    City.create(params[:city])
    ci = City.find_by(params[:city]).id
    params[:station][:city_id] = ci
    @station = Station.update(params[:id], params[:station])

    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect '/stations'
  end

  get '/station-dashboard' do
    erb :"stations/station-dashboard"
  end

#TRIPS STARTS HERE (ITERATION 4)
#DATES are not working...
  get '/trips' do
    @trips = Trip.all.paginate(:page => params[:page], :per_page => 5)
    erb :"trips/index"
  end

  get '/trips/new' do
    erb :"trips/new"
  end

  post '/trips' do
    start_station = Station.find_or_create_by(params[:start_station]).id
    end_station = Station.find_or_create_by(params[:end_station]).id
    params[:trip][:start_station_id] = start_station
    params[:trip][:end_station_id] = end_station
    # binding.pry
    Trip.create!(params[:trip])
    redirect "/trips"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'trips/edit'
  end

  put '/trips/:id' do
    start_station = Station.find_or_create_by(params[:start_station]).id
    end_station = Station.find_or_create_by(params[:end_station]).id
    params[:trip][:start_station_id] = start_station
    params[:trip][:end_station_id] = end_station
    @trip = Trip.update(params[:id], params[:trip])
    redirect "/trips/#{@trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

#WORKING :)
  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect '/trips'
  end

end
