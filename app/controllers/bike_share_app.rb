class BikeShareApp < Sinatra::Base

  get '/' do
    erb :homepage
  end

  get '/stations' do
    @stations = Station.all

    erb :"stations/index"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

end
