require 'pry'
require 'time'
class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

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
end
