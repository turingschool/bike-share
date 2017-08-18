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

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'stations/show'
  end

end
