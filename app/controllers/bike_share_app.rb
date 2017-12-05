require 'will_paginate'
# require 'pry'
require 'will_paginate/active_record'


class BikeShareApp < Sinatra::Base
  configure{ register WillPaginate::Sinatra}
  set :method_override, true

  get '/' do
    erb :welcome
  end

  get '/trips' do
    @trips = Trip.paginate(page: params[:page], per_page: 30)
    erb :"trips/index"
  end

  get '/trips/new' do
    erb :"trips/new"
  end

  post '/trips/new' do
    trip = Trip.create(params[:trip])
    redirect '/trips'
  end


   get '/trips/:id' do
     @trip = Trip.find(params[:id])
     erb :"trips/show"
   end

  put '/trips/:id' do |id|
    Trip.update(id.to_i, params[:trip])
    redirect "/trips"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end

  delete '/trips/:id' do |id|
    trip = Trip.destroy(id.to_i)
    redirect '/trips'
  end

  get '/trips-dashboard' do
    @trips = Trip.all
    @station =
    # binding.pry
    erb :"trips/dashboard"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/station-dashboard' do
    @stations = Station.all

    erb :"stations/dashboard"
  end

  get '/stations/new' do
    erb :"stations/new"
  end


  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end


  post '/stations' do
    station = Station.create(params[:station])
    redirect '/stations'
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    @trips = Trip.all
    # binding.pry
    erb :"stations/show"
  end

  delete '/stations/:id' do |id|
    station = Station.destroy(id.to_i)
    redirect '/stations'
  end

  get '/conditions' do
    @conditions = Condition.paginate(page: params[:page], per_page: 30)

    erb :"conditions/index"
  end

  get '/condition-dashboard' do
    @conditions = Condition.all

    erb :"conditions/dashboard"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end


  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :"conditions/edit"
  end


  post '/conditions' do
    condition = Condition.create(params[:condition])
    redirect '/conditions'
  end

  put '/conditions/:id' do |id|
    Condition.update(id.to_i, params[:condition])
    redirect "/conditions/#{id}"
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    # @trips = Trip.all
    # binding.pry
    erb :"conditions/show"
  end

  delete '/conditions/:id' do |id|
    station = Condition.destroy(id.to_i)
    redirect '/conditions'
  end

  get '/weather-dashboard' do

    erb :"conditions/dashboard"
  end



end
