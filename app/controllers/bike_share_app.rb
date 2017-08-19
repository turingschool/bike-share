class BikeShareApp < Sinatra::Base

  get '/station_dashboard' do
    @stations = Station.all
    erb :station_dashboard
  end

  get '/trips' do
    @trips = Trip.all
    erb :'/trips/index.erb'
  end

  get '/trips/:id' do
    @trip = Trip.find(id)
    erb :'/trips/show.erb'
  end

  get '/trips/new' do
    erb :'/trips/new.erb'
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

  delete 'trips/:id' do
    Trip.delete(id)
    redirect '/trips'
  end
end
