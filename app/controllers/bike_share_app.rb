require 'will_paginate'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base
  configure { register WillPaginate::Sinatra }
  set :method_override, true

  get '/stations/dashboard' do
    @stations = Station.all
    erb :'/stations/dashboard'
  end

  get '/stations' do
    @stations = Station.paginate(page: params[:page], per_page: 30)
    erb :'/stations/index'
  end

  get '/stations/new' do
    @cities = City.all
    erb :'/stations/new'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'/stations/show'
  end

  post '/stations' do
    params[:station][:installation_date] = Date.strptime((params[:station][:installation_date]), "%Y-%m-%d")

    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id/edit' do
    @cities  = City.all
    @station = Station.find(params[:id])
    erb :'/stations/edit'
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  get '/trips' do
    @paginated = Trip.paginate(page: params[:page], per_page: 30)
    erb :'/trips/index'
  end

  get '/trips/dashboard' do
    @cool_variable = ['stuff', 'and', 'things']
    erb :'trips/dashboard'
  end

  get '/trips/new' do
    erb :'/trips/new'
  end

  get '/trips/:id' do
    @trips = Trip.find(params[:trip])
    erb :'/trips/show'
  end

  post '/trips' do
    Trip.update(params[:trip_id])
    redirect "/trips"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'/trips/edit'
  end

  put '/trips' do |id|
    Trip.create(id.to_i, params[:trips])
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id.to_i)
    redirect "/trips"
  end
end
