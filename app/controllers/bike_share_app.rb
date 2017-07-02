class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"dashboard"
  end

  get '/stations' do
    @stations = Station.all
    erb :"/stations/index"
  end

  get '/stations/new' do
    erb :"/stations/new"
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect :"/stations/#{@station.id}"
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :'/stations/show'
  end

  get '/stations/:id/edit' do |id|
    @station = Station.find(id)

    erb :"/stations/edit"
  end

  put '/stations/:id' do
    @station = Station.update(params[:id], params[:station])
    redirect "/stations/#{@station.id}"
  end

  delete '/stations/:id' do |id|
    @station = Station.destroy(id)

    redirect '/stations'
  end
end
