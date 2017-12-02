class BikeShareApp < Sinatra::Base

  set :method_override, true

  get '/' do
    erb :"/dashboard"
  end

  get '/station-dashboard' do
    erb :"/station-dashboard"
  end

  get '/stations/index' do
    @stations = Station.all

    erb :"/stations/index"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])

    erb :"/stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])

    erb :"/stations/edit"
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])

    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)

    redirect "/stations/index"
  end

  get '/trips' do
    @trips = Trip.all

    erb :"/trips/index"
  end
end
