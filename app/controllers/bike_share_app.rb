class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/station-dashboard' do
    @stations = Station.all
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :index
  end

  get '/stations/new' do
    @cities = City.all
    erb :new
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :show
  end

  post '/stations' do
    params[:station][:installation_date] = Date.strptime((params[:station][:installation_date]), "%Y-%m-%d")

    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id/edit' do
    @cities  = City.all
    @station = Station.find(params[:id])
    erb :edit
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end


  get '/trips' do
    @trips = Trip.all
    erb :'/trips/index'
  end

  get '/trips/new' do
    erb :'/trips/new'
  end

  get '/trips/:id' do
    @trips = Trip.find(params[:trip])
    erb :'/trips/show'
  end

  post '/trips' do
    Trip.update(params[:trip_id])
    redirect "/trips"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'/trips/edit'
  end

  put '/trips' do |id|
    Trip.create(id.to_i, params[:trips])
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id.to_i)
    redirect "/trips"
  end
end
