require 'pry'
require 'time'
# require 'chartkick' - causing sinatra to crash, not sure if implementing right
class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :home
  end

  get '/station-dashboard' do
    @station = Station.all
    @city = City.all
    erb :'stations/station_dashboard'
  end

  get '/stations' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    @cities = City.all
    erb :'stations/new'
  end

  post '/stations' do
    city = City.find(params[:station][:city_id])
    @station = Station.create(params[:station])
    city.stations << @station
    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'stations/show'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    @cities = City.all
    erb :'stations/edit'
  end

  put '/stations/:id' do |id|
    station = Station.find(id)
    station.update(params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id)
    redirect '/stations'
  end

  get '/cities' do
    @cities = City.all
    erb :'cities/index'
  end

  get '/cities/:id' do
    @station = Station.all
    @city = City.find(params[:id])
    erb :'/cities/city'
  end

  # get '/cities/new' do
  #   erb :'/cities/new'
  # end

  # post '/cities' do
  #   @city = City.create(params[:city])
  #   redirect "/cities/#{@city.id}"
  # end

  delete '/cities/:id' do |id|
    City.destroy(id)
    redirect '/cities'
  end

  get '/trips/new' do
    @stations = Station.all
    erb :'trips/new'
  end

  post '/trips' do
    @trip = Trip.create(params[:trip])
    redirect "/trips/#{@trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'trips/show'
  end

  get '/trips' do
    @trips = Trip.get_first_30
    erb :'trips/index'
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'trips/edit'
  end

  put '/trips/:id' do
    trip = Trip.find(params[:id])
    trip.update(params[:trip])
    redirect "/trips/#{params[:id]}"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])
    redirect "/trips"
  end
end
