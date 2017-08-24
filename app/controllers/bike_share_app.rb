require 'will_paginate'
require 'will_paginate/active_record'
require 'chartkick'

class BikeShareApp < Sinatra::Base

  get '/' do
    erb :index
  end

  configure do
    register WillPaginate::Sinatra
  end

  get '/stations' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    erb :'stations/new'
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect "stations/#{@station.id}"
  end

  get '/station-dashboard' do
    erb :'stations/dashboard'
  end
#weather conditions
  get '/conditions' do
    Condition.connection
    @pages = Condition.paginate(page: params[:page])
    @conditions = Condition.order('date DESC').page(params[:page])
    erb :"conditions/index"
  end

  get '/conditions' do
    @conditions = Condition.all
    erb :'conditions/index'
  end

  get '/conditions/new' do
    erb :'conditions/new'
  end

  post '/conditions' do
    @condition = Condition.create(params[:condition])
    redirect :"conditions/#{@condition.id}"
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :'conditions/show'
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :'conditions/edit'
  end

  put '/conditions/:id' do
    @condition = Condition.update(params[:id], params[:condition])
    redirect :"/conditions/#{@condition.id}"
  end

  delete '/conditions/:id' do
    Condition.destroy(params[:id])
    redirect '/conditions'
  end

  get '/weather-dashboard' do
    erb :'conditions/dashboard'
  end

  get '/trips' do
    Trip.connection
    @pages = Trip.paginate(page: params[:page])
    @trips = Trip.order('start_date DESC').page(params[:page])
    erb :"trips/index"
  end

  get '/trips' do
    @trips = Trip.all
    erb :'trips/index'
  end

  get '/trips/new' do
    @stations = Station.all
    erb :'trips/new'
  end

  post '/trips' do
    @trip = Trip.create(params[:trip])
    redirect :"trips/#{@trip.id}"
  end

  get '/trips-dashboard' do
    erb :'trips/dashboard'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'stations/show'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'stations/edit'
  end

  put '/stations/:id' do
    @station = Station.update(params[:id], params[:station])
    redirect "stations/#{@station.id}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'trips/show'
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'trips/edit'
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:id], params[:trip])
    redirect :"trips/#{@trip.id}"
  end

  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect '/trips'
  end
end
