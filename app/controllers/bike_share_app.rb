class BikeShareApp < Sinatra::Base
  get '/stations/new' do
    @station = Station.new
    erb :'stations/new'
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :"stations/show"
  end

  delete '/stations/:id' do |id|
    Station.destroy(params[:id])
    redirect "/stations"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  post '/stations' do
    station_details = params[:station]
    station_details[:installation_date] = Date.strptime(station_details[:installation_date],'%m/%d/%Y')
    @station = Station.create!(station_details)
    redirect "/stations/#{@station.id}"
  end
end
