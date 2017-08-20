require 'will_paginate'
require 'will_paginate/active_record'

require 'pry'
class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  configure do
    register WillPaginate::Sinatra
  end

  get '/' do
    erb :'/root/index'
  end

  get '/stations' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/dashboard' do
    @stations = Station.all
    erb :'stations/dashboard'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'stations/show'
  end

  get '/trips' do
    Trip.connection
    @pages = Trip.paginate(page: params[:page], :per_page => 30)
    @trips = Trip.order('start_date DESC').page(params[:page])
    erb :'/trips/index'
  end

  get '/trips/new' do
    @stations = Station.all
    erb :"trips/new"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end

  post '/trips' do
    Trip.create(params)
    redirect '/trips'
  end

  get '/trips/:id/edit' do
    @trips = Trip.find(params[:id])
    erb :'/trips/edit'
  end

  put '/trips/:id' do
    Trip.update(params, id)
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do
    Trip.delete(id)
    redirect '/trips'
  end

  get '/trip-dashboard' do
    erb :'trips_dashboard'
  end

end
