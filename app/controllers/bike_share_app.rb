class BikeShareApp < Sinatra::Base

  get '/' do
    "hello"
  end

  get '/stations' do
    @stations = Station.all
    erb :'/station/index'
  end

  get '/stations/new' do
    erb :'/station/new'
  end

  post '/stations' do
    @stations = Station.create(params[:station])
    redirect "/stations/#{@stations.id}"
  end

  get '/stations/:id' do
    @stations = Station.find(params[:id])
    erb :'/station/show'
  end

  get '/stations/:id/edit' do
    @stations = Station.find(params[:id])
    erb :'/station/edit'
  end

  put '/stations/:id' do
    @station = Station.update(params[:station])
    redirect "/stations/#{params[:id]}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

  get '/station-dashboard' do
    @stations = Station.all
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
    @trips = Trip.create(params[:trip])
    redirect "/trips/#{@trips.id}"
  end

  get '/trips/:id' do
    @trips = Trip.find(params[:id])
    erb :'/trip/show'
  end

  get '/trips/:id/edit' do
    @trips = Trip.find(params[:id])
    erb :'/trip/edit'
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:trip])
    redirect "/trips/#{params[:id]}"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])
    redirect '/trips'
  end

  get '/trip-dashboard' do
    @trips = Trip.all
    erb :'/trip/dashboard'
  end
end
