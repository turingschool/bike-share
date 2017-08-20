require 'pry'

class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :'/root/index'
  end

  get '/stations' do
    @stations = Station.all
    erb :'/stations/index'
  end

  get '/stations/dashboard' do
    @stations = Station.all
    erb :'/stations/dashboard'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'/stations/show'
  end

  post '/stations' do
    station = Station.new(params)
    station.save
    redirect '/stations'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'/stations/edit'
  end

  put '/stations/:id' do |id|
    Station.update(id, params[:station])
    redirect '/stations/#{id}'
  end

  get '/trips' do
    @trips = Trip.all
    erb :'/trips/index.erb'
  end

  get '/trips/new' do
    @stations = Station.all
    erb :"trips/new"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'/trips/show.erb'
  end

  post '/trips' do
    Trip.create(params)
    redirect '/trips'
  end

  get '/trips/:id/edit' do
    @task = Task.find(id)
    erb :'/trips/edit.erb'
  end

  put '/trips/:id' do
    Trip.update(params, id)
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do
    Trip.delete(id)
    redirect '/trips'
  end

  get '/trip-dashboard' do
    erb :'trips_dashboard'
  end

end
