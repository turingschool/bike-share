class BikeShareApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :'/station/index'
  end

  get '/stations/new' do
    erb :'station/new'
  end

  post '/stations' do
    station = Station.new(params)
    station.save
    redirect '/stations'
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :'/station/show'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'/station/edit'
  end

  put '/stations/:id' do |id|
    Station.update(id, params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id)
    redirect '/stations'
  end

  get '/stations-dashboard' do
    erb :'/station/dashboard'
  end

  get '/trips' do
    @trips = Trip.all
    erb :'/trip/index'
  end

  get '/trips/new' do
    erb :'/trip/new'
  end

  post '/trips' do
    trip = Trip.new(params)
    trip.save
    redirect '/trips'
  end

  get '/trips/:id' do |id|
    @trip = Trip.find(id)
    erb :'/trip/show'
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'/trip/edit'
  end

  put '/trips/:id' do |id|
    Trip.update(id, params[:trip])
    redirect '/trips/#{id}'
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id)
    redirect '/trips'
  end

  get 'trips/dashboard' do
    erb :'/trip/dashboard'
  end
end
