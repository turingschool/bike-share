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

  get '/stations/:id' do
    @task = Station.find(params[:id])
    erb :show
  end

end
