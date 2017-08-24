require 'pry'
require 'will_paginate'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base

  configure do
    set :method_override, true
    register WillPaginate::Sinatra
  end

  get '/' do
    erb :'home/index'
  end

  get '/stations' do
    @cities = City.all
    @stations = Station.all

    erb :'stations/index'
  end

  get '/stations/new' do
    @cities = City.all
    erb :'stations/new'
  end

  get '/station-dashboard' do
    @stations = Station.all
    erb :'stations/station-index'
  end

  post '/stations' do
    city = City.find(params[:station][:city_id])
    @station = Station.create(params[:station])
    city.stations << @station
    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'stations/show'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    @cities = City.all
    erb :'stations/edit'
  end

  put '/stations/:id' do |id|
    station = Station.find(id)
    station.update(params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id)
    redirect '/stations'
  end

  get '/cities' do
    @cities = City.all
    @stations = Station.all
    erb :'cities/index'
  end

  get '/cities/:id' do
    @city = City.find(params[:id])
    erb :'cities/show'
  end

  get '/trips' do
    @trips = Trip.all.paginate(:page => params[:page], :per_page => 30)
    erb :"trips/index"
  end

  get '/trips/new' do
    @stations = Station.all
    erb :'trips/new'
  end

  get '/trips-dashboard' do
    @stations = Station.all
    @trips = Trip.all
    @conditions = Condition.all
    erb :'trips/dashboard'
  end

  post '/trips/' do
    @trip = Trip.create(params[:trip])
    binding.pry
    redirect "/trips/#{@trip.id}"
  end

  put '/trips/:id' do |id|
    trip = Trip.find(id)
    trip.update(params[:trip])
    redirect "/trip/#{id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'trips/show'
  end

  get '/trips/:id/edit' do
    @stations = Station.all
    @trip = Trip.find(params[:id])
    erb :'/trips/edit'
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id)
    redirect '/trips'
  end

  get '/conditions' do
    @conditions = Condition.all.paginate(:page => params[:page], :per_page => 30)
    erb :'/conditions/index'
  end

  get '/conditions/new' do
    @conditions = Condition.all
    erb :'/conditions/new'
  end

  post '/conditions' do
    @condition = Condition.create(params[:condition])
    redirect "/conditions/#{@condition.id}"
  end

  get '/conditions/temps' do
    Condition.eager_load(:date)
    @condition = Condition.all
    @temp_range = params[:temp_range].to_i
    erb :'/conditions/temps'
  end

  get '/conditions/visability' do
    Condition.eager_load(:date)
    @condition = Condition.all
    @temp_range = params[:temp_range].to_i
    erb :'/conditions/visability'
  end

  get '/conditions/windspeed' do
    Condition.eager_load(:date)
    @condition = Condition.all
    @temp_range = params[:temp_range].to_i
    erb :'/conditions/windspeed'
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :'conditions/show'
  end

  get '/conditions/:id/edit' do
    @conditions = Condition.all
    @condition = Condition.find(params[:id])
    erb :'/conditions/edit'
  end

  put '/conditions/:id' do |id|
    condition = Condition.find(id)
    condition.update(params[:condition])
    redirect "/conditions/#{id}"
  end

  delete '/conditions/:id' do |id|
    Condition.destroy(id)
    redirect '/conditions'
  end

  get '/condition-dashboard' do
    erb :'/conditions/condition-dashboard'
  end




end
