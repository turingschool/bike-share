require 'pry'

class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/stations' do
    erb :"stations/index"
  end

  get '/stations/new' do
    @cities = City.all
    erb :"stations/new"
  end

  post '/stations' do
    city = City.find_by name: params[:city][:name]
    station = city.stations.create(params[:station])
    redirect "/stations/#{station.id}"
  end

  get '/stations/view_all' do
    @stations = Station.all
    erb :"stations/view_all"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    @cities = City.all
    erb :"stations/edit"
  end

  put '/stations/:id' do |id|
    @station = Station.find(params[:id])
    @station.update(params[:station])
    @station.update_city_id(params[:city][:name], @station)
    # city = City.find_by name: params[:city]["name"]
    # Station.find(params:id]).update(city_id: city.id)
    redirect "stations/#{@station.id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect "/stations/view_all"
  end

  get '/station_dashboard' do
    @stations = Station.all
    erb :station_dashboard
  end

end
