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

  get '/trips' do
    @trips = Trip.all.paginate(:page => params[:page], :per_page => 5)
    erb :"trips/index"
  end

  get '/trips/new' do
    erb :"trips/new"
  end

  post '/trips' do
    Trip.create!(params[:trip])
    redirect "/trips"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'trips/edit'
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:id], params[:trip])
    redirect "/trips/#{@trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect '/trips'
  end

#ITERATION 7 CONDITIONS STARTS HERE

  get '/conditions' do
    @conditions = Condition.all
    erb :"conditions/index"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end

  post '/conditions' do
    Condition.create(params[:condition])
    redirect "/conditions"
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :'conditions/edit'
  end

  put '/conditions/:id' do
    @condition = Condition.update(params[:id], params[:condition])
    redirect "/conditions/#{@condition.id}"
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  delete '/conditions/:id' do
    @condition = Condition.destroy(params[:id])
    redirect '/conditions'
  end

end
