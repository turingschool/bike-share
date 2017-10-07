require 'will_paginate'
require 'will_paginate/active_record'

require_relative '../models/station.rb'

class BikeShareApp < Sinatra::Base
  configure do
    register WillPaginate::Sinatra
  end
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :home
  end

  get '/stations' do
    @stations = Station.paginate(page: params[:page], per_page: 30)
    erb :'station/index'
  end

  get '/stations/new' do
    erb :'station/new'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'station/show'
  end

  get '/station-dashboard' do
    @stations = Station.all
    erb :'station/dashboard'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'station/edit'
  end

  post '/stations' do
    id = Station.create(params[:station]).id
    redirect "stations/#{id}"
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/station/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  get 'trip-dashboard' do
    erb :'trip/dashboard'
  end

  get '/trips' do
    @trips = Trip.paginate(page: params[:page], per_page: 30)
    erb :'trip/index'
  end

  get '/trips/new' do
    erb :'trip/new'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'trip/show'
  end

  get '/trips/:id/edit' do
    @stations = Station.all
    @trip = Trip.find(params[:id])
    erb :'trip/edit'
  end

  post '/trips' do
    trips = Trip.create(params[:trip])
    redirect '/trips'
  end

  put '/trips/:id' do |id|
    Trip.update(id.to_i, params[:trip])
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id.to_i)
    redirect '/trips'
  end

  not_found do
    erb :not_found
  end
end
