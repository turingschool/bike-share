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

  get '/stations/:id/edit' do |id|
    @station = Station.find(id)
    erb :'/station/edit'
  end

  put '/stations/:id/edit' do |id|
    @station = Station.find(id)
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do
    Station.destroy[:id].to_i
  end
end
