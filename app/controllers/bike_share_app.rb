class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"home/index"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do
    station = Station.update(params[:id], params[:station])

    redirect "/stations/#{station.id}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])

    redirect '/stations'
  end
end
