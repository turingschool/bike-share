require 'pry'
require_relative 'pagination'

class BikeShareApp < Sinatra::Base
    set :method_override, true

    include Pagination

  get '/' do
    erb :"home/index"
  end

  get '/station-dashboard' do
    @station_count = Station.station_count
    @bike_average = Station.bike_average
    @most_bikes = Station.most_bikes
    @stations_with_most_bikes = Station.top_bikes
    @few_bikes = Station.few_bikes
    @stations_with_fewest_bikes = Station.fewest_bikes
    @newest_station = Station.newest_station
    @oldest_station = Station.oldest_station
    erb :"station/dashboard"
  end

  get '/stations' do
    @stations = Station.all
    erb :"station/index"
  end

  get '/stations/new' do
    erb :"station/new"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end



  post '/stations' do
    @station = Station.create(params[:station])
    redirect '/stations'
  end

  post '/conditions' do
    @condition = Condition.create(params[:condition])
    redirect '/conditions'
  end

  get '/stations/:id' do
    id = params[:id]
    @station = Station.find(id)
    erb :"station/show"
  end


  get '/trips' do
    @trips = Trip.all
    erb :"trip/index"
  end

  get '/conditions' do
    redirect '/conditions/page/1'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"station/edit"
  end

  

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :"conditions/edit"
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  put '/stations/:id' do
    @station = Station.update(params[:id].to_i, params[:station])
    redirect '/stations'
    #redirect '/stations/#{@station.id}' isn't working
  end

  put '/conditions/:id' do
    @condition = Condition.update(params[:id].to_i, params[:condition])
    redirect '/conditions'
  end

  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect '/stations'
  end


  get '/trips' do
    @trips = Trip.all
    erb :"trip/index"
  end

  get '/trips/new' do
    erb :"/trip/new"
  end

  post '/trips' do
    @trip = Trip.create(params[:trip])
    redirect '/trips'
  end

  delete '/conditions/:id' do
    @condition = Condition.destroy(params[:id])
    redirect '/conditions'
  end

  get '/conditions/page/:num' do |num|
      @conditions = page_display(Condition, num.to_i)
      @next_page = next_page(num.to_i, Condition.count)
      @previous_page = previous_page(num.to_i)
      erb :"conditions/index"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :"trip/edit"
  end

  get '/trips/:id' do
    id = params[:id]
    @trip = Trip.find(id)
    erb :"trip/show"
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:id].to_i, params[:trip])
    redirect '/trips'
    #redirect '/trips/#{@trip.id}' isn't working
  end
end
