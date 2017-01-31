class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  #read - all
  get '/stations' do
    @stations = Station.all
    erb:"stations/index"
  end

  #create - new station
  get '/stations/new' do
    @station = Station.new
    erb:"stations/new"
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect "/stations/#{@station.id}"
  end

  #read - one

  #update -one
  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb:"/stations/edit"
  end

  put '/stations/:id' do
    @station = Station.update(params[:id], params[:station])
    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb:"/stations/show"
  end

  #delete - one from show
  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect "/stations"
  end

  #delete - one from index?

  #station-dashboard

  get '/station-dashboard' do
    @stations = Station.all
    erb:"/stations/dashboard"
  end

end
