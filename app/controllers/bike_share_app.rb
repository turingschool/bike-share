require 'will_paginate'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base
  set :method_override, true

  configure do
    register WillPaginate::Sinatra
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/station-dashboard' do
    erb :"stations/station-dashboard"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  post '/stations' do
    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do
    station = Station.find(params[:id])
    station.update(params[:station])
    redirect "/stations"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect "/stations"
  end

  get '/trips' do
    Trip.connection
    @pages = Trip.paginate(page: params[:page])
    @trips = Trip.order('start_date DESC').page(params[:page])
    erb :"trips/index"
  end

  get '/trips/new' do
    erb :"trips/new"
  end

  post '/trips' do
    Trip.create(params[:trip])
    redirect '/trips'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end

  put '/trips/:id' do
    trip = Trip.find(params[:id])
    trip.update(params[:trip])
    redirect "/trips"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])
    redirect "/trips"
  end


  get '/' do
    erb :index
  end

  get '/trips-dashboard' do
    erb :"trips/trip-dashboard"
  end

  get '/weathers' do
    @weathers = Weather.all
    erb :"weathers/index"
  end

  get '/weathers/new' do
    erb :"weathers/new"
  end

  post '/weathers' do
    Weather.create(params[:weather])
    redirect '/weathers'
  end

  get '/weathers/:id' do
    @weather = Weather.find(params[:id])
    erb :"weathers/show"
  end

  get '/weathers/:id/edit' do
    @weather = Weather.find(params[:id])
    erb :"weathers/edit"
  end

  put '/weathers/:id' do |id|
    Weather.update(id.to_i, params[:weather])
    redirect "/weathers"
  end

  delete '/weathers/:id' do |id|
    Weather.destroy(id.to_i)
    redirect '/weathers'
  end
end
