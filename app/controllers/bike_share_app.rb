require 'will_paginate'
require 'will_paginate/active_record'
require 'pry'

class BikeShareApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  get '/' do
    binding.pry
    erb :index
  end

  get '/stations' do
    @stations = Station.all.paginate(:page => params[:page], :per_page => 30)
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  post '/stations' do
    add_city_to_station(params)
    redirect "/stations"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'stations/edit'
  end

  put '/stations/:id' do
    update_station(params)
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
    @trips = Trip.all.paginate(:page => params[:page], :per_page => 30)
    binding.pry
    erb :"trips/index"
  end

  get '/trips/new' do
    erb :"trips/new"
  end

  post '/trips' do
    add_station_to_trip(params)
    add_subscription_type_to_trip(params)
    redirect "/trips"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'trips/edit'
  end

  put '/trips/:id' do
    add_station_to_trip(params)
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

  get '/trips-dashboard' do
    @monthly_totals = Trip.monthly_totals
    @subscription_counts = SubscriptionType.type_breakout
    @all_subscriptions = SubscriptionType.all.count
    erb :"trips/trip-dashboard"
  end

  get '/conditions' do
    @conditions = Condition.all.paginate(:page => params[:page], :per_page => 30)
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

  get '/conditions-dashboard' do
    erb :"conditions/condition-dashboard"
  end

private
  def add_city_to_station(params)
    City.create(params[:city])
    ci = City.find_by(params[:city]).id
    params[:station][:city_id] = ci
    Station.create(params[:station])
  end

  def update_station(params)
    City.create(params[:city])
    ci = City.find_by(params[:city]).id
    params[:station][:city_id] = ci
  end

  def add_station_to_trip(params)
    start_station = Station.find_or_create_by(params[:start_station]).id
    end_station = Station.find_or_create_by(params[:end_station]).id
    params[:trip][:start_station_id] = start_station
    params[:trip][:end_station_id] = end_station
  end

  def add_subscription_type_to_trip(params)
    sti = SubscriptionType.find_or_create_by(flavor: params[:subscription_type][:flavor]).id
    params[:trip][:subscription_type_id] = sti
    Trip.create!(params[:trip])

  end


end
