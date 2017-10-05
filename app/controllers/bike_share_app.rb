require_relative '../models/station.rb'
class BikeShareApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/stations' do
    @stations = Station.all
    erb :'station/station_index'
  end

  get '/stations/new' do
    erb :'station/station_new'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'station/station'
  end


  # get 'station-dashboard' do
    # @station = Station.all
  # end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'station/station_edit'
  end

  post '/stations' do
    station = Station.create(params[:station])
    redirect '/stations'
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  not_found do
    erb :not_found
  end

end
