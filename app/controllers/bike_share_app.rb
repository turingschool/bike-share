require 'pry'

class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"home/index"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/show/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  post '/stations/new' do
    station = Station.create(params[:station])
    redirect "station/show/#{station.id}"
  end

end
