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
    @cities = City.all
    erb :new
  end

  post '/stations' do
    city = City.find(params[:station][:city_id])
    @station = Station.create(params[:station])
    city.stations << @station
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
end
