require_relative '../models/station.rb'

class BikeShareApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/stations' do
    @stations = Station.all
    erb :'station/index'
  end

  get '/stations/new' do
    erb :'station/new'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'station/details'
  end

  get 'station-dashboard' do
    erb :'station/dashboard'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'station/edit'
  end

  post '/stations' do
    id = Station.create(params[:station]).id
    redirect "stations/#{id}"
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/station/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  not_found do
    erb :not_found
  end

end
