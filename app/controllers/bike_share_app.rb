class BikeShareApp < Sinatra::Base

  get '/' do
    erb :homepage
  end

  get '/stations' do
    @stations = Station.all

    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  post '/stations' do
    Station.create(params[:station])
    redirect '/stations'
  end

end
