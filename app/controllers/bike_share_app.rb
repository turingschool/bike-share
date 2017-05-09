require 'pry'

class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"home/index"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    @city = City.new()
    @station = Station.new()
    erb :"stations/new"

  end

  post '/stations/new' do
    @city = City.find_or_create_by(name: params[:city])
    @station = Station.new(params[:station])
    if @station.invalid? || @city.invalid?
      @city.invalid? 
      erb :"stations/new"
    else
      @station.save
      @city.stations << @station
      redirect "stations/#{@station.id}"
    end 

  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
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

end