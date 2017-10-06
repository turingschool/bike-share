require_relative '../models/station.rb'

class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :'station-index'
  end

  get '/stations/new' do
    erb :'station-new'
  end

  post '/stations' do
    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'station-show'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'station-edit'
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

  get '/station-dashboard' do
    @stations = Station.all
    erb :'station-dashboard'
  end

  get '/trips' do 
    @trips = Trip.all
    erb :'trip-dashboard'
  end

	get 'trips/:id' do
		@trip = trip.find(params[:id])
		erb :'trip-show'
	end 
  
  get '/trips/new' do 
		erb :'trip-new'    
  end 
 
end
