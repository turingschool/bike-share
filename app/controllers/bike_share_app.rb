require_relative '../models/station.rb'

class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :index
  end

  get '/stations/new' do
    erb :new
  end

  post '/stations' do
    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :show
  end

  #   require 'pry'; binding.pry

#TODO route to see form to update station
#TODO route to actually update station
#TODO route to delete station


end
