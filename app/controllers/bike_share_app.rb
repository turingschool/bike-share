require 'pry'
require 'will_paginate'
require 'will_paginate/active_record'

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
    erb :'/stations/index'
  end

  get '/stations-dashboard' do
    @stations = Station.all
    erb :'/stations/dashboard'
  end

  get '/stations/new' do
    erb :'/stations/new'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'/stations/show'
  end

  post '/stations' do
    station = Station.new(params)
    station.save
    redirect '/stations'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'/stations/edit'
  end

  put '/stations/:id' do |id|
    Station.update(id, params[:station])
    redirect "/stations/#{id}"
  end  #fixed by adding end tag, but unsure if the route is right. Did not edit what was already written. -joel

  delete '/stations/:id' do |id|
    Station.destroy(id)
    redirect'/stations'
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

  get '/trips-dashboard' do
    erb :'trips/dashboard'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end

  put '/trips' do
    trip = Trip.create(params[:trip])
    redirect "/trips/#{trip.id}"
  end

  get '/trips/:id/edit' do
    @trips = Trip.find(params[:id])
    @stations = Station.all
    erb :'/trips/edit'
  end

  put '/trips/:id' do |id|
    Trip.update(id, params[:trip])
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do
    Trip.delete(params[:id])
    redirect '/trips'
  end
end
