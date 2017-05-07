require 'pry'
require 'time'
class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :home
  end

  get '/stations' do
    @stations = Station.all
    erb :index
  end

  get '/stations/new' do
    erb :new
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :station
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :edit
  end

  put '/stations/:id' do |id|
    station = Station.find(id)
    station.update(params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id)
    redirect "/stations"
  end

  get '/cities' do
    @cities = City.all
    erb :'cities/index'
  end

  get '/cities/:id' do
    @city = City.find(params[:id])
    erb :'/cities/city'
  end

  get '/cities/new' do
    erb :'/cities/new'
  end

  post '/cities' do
    @city = City.create(params[:city])
    redirect "/cities/#{@city.id}"
  end
end
