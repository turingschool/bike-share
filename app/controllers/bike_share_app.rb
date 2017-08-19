class BikeShareApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :'/station/index'
  end

  get '/stations/new' do
    erb :'/station/new'
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
end
