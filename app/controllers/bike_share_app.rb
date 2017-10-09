require_relative '../models/station.rb'
require 'will_paginate/view_helpers/sinatra'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base
	include WillPaginate::Sinatra::Helpers
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :station_index
  end

  get '/stations/new' do
    erb :station_new
  end

  post '/stations' do
    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :station_show
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :station_edit
  end

  put '/stations/:id' do
    station = Station.find(params[:id])
    station.update(params[:station])
    redirect "/stations/#{params[:id]}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

  get '/conditions' do
    @conditions = Condition.paginate(page: params[:page], per_page: 30)
    erb :condition_index
  end

  get '/conditions/new' do
    erb :condition_new
  end

  post '/conditions' do
    Condition.create(params[:condition])
    redirect '/conditions'
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :condition_show
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :condition_edit
  end

  put '/conditions/:id' do
    condition = Condition.find(params[:id])
    condition.update(params[:condition])
    redirect "/conditions/#{params[:id]}"
  end

  delete '/conditions/:id' do
    Condition.destroy(params[:id])
    redirect '/conditions'
  end

  get '/station-dashboard' do
    @stations = Station.all
    erb :station_dashboard
  end

  get '/trips' do
    @trips = Trip.paginate(page: params[:page], per_page: 30)
    erb :trip_index
  end

  get '/trips/new' do
    erb :trip_new
  end

	post '/trips' do
		Trip.create(params[:trip])
		redirect '/trips'
	end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :trip_show
  end

	get '/trips/:id/edit' do
		@trip = Trip.find(params[:id])
		erb :trip_edit
  end

  put '/trips/:id' do
    trip = Trip.find(params[:id])
    trip.update(params[:trip])
    redirect "/trips/#{params[:id]}"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])
    redirect '/trips'
  end
end
