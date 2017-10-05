require_relative '../models/station.rb'

class BikeShareApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)
  set :method_override, true

    get '/' do
      erb :home
    end

    get '/films/new' do
      erb :film_new
    end
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
<<<<<<< HEAD
    stations = Station.create(params[:station])
    redirect '/stations'
=======
    id = Station.create(params[:station]).id
    redirect "stations/#{id}"
>>>>>>> master
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/station/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

###############
  # get 'trip-dashboard' do
  #
  # end

  get '/trips' do
    @trips = Trip.all
    erb :details
  end

  get '/trips/new' do
    erb :new
  end

  get '/trips/:id' do
    @trips = Trip.find(params[:id])
    erb :show
  end

  get '/trips/:id/edit' do
    @trips = Trip.find(params[:id])
    erb :edit
  end

  post '/trips' do
    trips = Trip.create(params[:trip])
    redirect '/trips'
  end

  put '/trips/:id' do |id|
    Trip.update(id.to_i, params[:trip])
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id.to_i)
    redirect '/trips'
  end

###################

  not_found do
    erb :not_found
  end

end
