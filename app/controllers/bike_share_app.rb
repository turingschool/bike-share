class BikeShareApp < Sinatra::Base

  set :method_override, true

  get '/' do
    erb :"home/dashboard"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  post '/stations' do
    station = Station.new(params[:station])
    station.save
    redirect "/stations"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do
    @station = Station.update(params[:id], params[:station])
    redirect "/stations/#{@station.id}"
  end

  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect "/stations"
  end

  get '/stations-dashboard' do
    @stations = Station.all
    erb :"stations/dashboard"
  end


  #-----------------------------Trips

  get '/trips' do
    @trips = Trip.all
    erb :"trips/index"
  end

  get '/trips/new' do
    erb :"trips/new"
  end

  post '/trips' do
    trip = Trip.new(params[:trip])
    trip.save
    redirect "/trips"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:id], params[:trip])
    redirect "/trips/#{@trip.id}"
  end

  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect "/trips"
  end
end
