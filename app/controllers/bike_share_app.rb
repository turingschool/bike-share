class BikeShareApp < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/stations' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    erb :'stations/new'
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect :"stations/#{@station.id}"
  end

  get '/station-dashboard' do
    erb :'stations/dashboard'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'stations/show'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'stations/edit'
  end

  put '/stations/:id' do
    @station = Station.update(params[:id])
    redirect :"stations/#{@station.id}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

  get '/trips' do
    @trips = Trip.all
    erb :'trips/index'
  end

  get '/trips/new' do
    erb :'trips/new'
  end

  post '/trips' do
    @trip = Trip.create(params[:trip])
    redirect :"trips/#{@trip.id}"
  end
  
  get '/trips-dashboard' do
    erb :'trips/dashboard'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'trips/show'
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'trips/edit'
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:id])
    redirect :"trips/#{@trip.id}"
  end

  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect '/trips'
  end
end
