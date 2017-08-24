require 'pry'
require 'will_paginate'
require 'will_paginate/active_record'
require "will_paginate-bootstrap"
require 'chartkick'
require 'groupdate'

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
    Station.connection
    @pages = Station.paginate(page: params[:page], :per_page => 20)
    @stations = Station.order('id ASC').page(params[:page])
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
    @lat = @station.lat
    @long = @station.long
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
  end

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

  get '/trips-dashboard' do
    erb :'trips/dashboard'
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

  get '/conditions' do
    Condition.connection
    @pages = Condition.paginate(page: params[:page], :per_page => 20)
    @conditions = Condition.order('id ASC').page(params[:page])
    erb :'/conditions/index'
  end

  get '/conditions-dashboard' do
    @conditions = Condition.all
    erb :'/conditions/dashboard'
  end

  get '/conditions/new' do
    @conditions = Condition.all
    erb :'/conditions/new'
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :'/conditions/show'
  end

  post '/conditions' do
    condition = Condition.create(params)
    redirect "/conditions/#{condition.id}"
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :'/conditions/edit'
  end

  put '/conditions/:id' do |id|
    Condition.update(id, params[:condition])
    redirect "/conditions/#{id}"
  end

  delete '/conditions/:id' do
    Condition.delete(params[:id])
    redirect '/conditions'
  end

end
