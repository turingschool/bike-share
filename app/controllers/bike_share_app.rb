require 'pry'

class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"home/index"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  post '/stations/new' do
    city = City.find_or_create_by(name: params[:city])
    station = city.stations.create(params[:station])
    redirect "stations/show/#{station.id}"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do
    city = City.find_or_create_by(name: params[:city])
    city.stations.find(params[:id]).update(params[:station])

    redirect '/stations'
  end

  delete '/stations/:id' do
    station = Station.find(params[:id])
    station.destroy
    redirect '/stations'
  end
s
end