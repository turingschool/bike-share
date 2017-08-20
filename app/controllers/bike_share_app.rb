class BikeShareApp < Sinatra::Base
  get '/' do
    erb :'home/index'
  end

  get '/stations' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    @cities = City.all
    erb :'stations/new'
  end

  # post '/stations' do
  #   city = City.find(params[:station][:city_id])
  #   @station = Station.create(params[:station])
  #   city.stations << @station
  #   redirect "/stations/#{@station.id}"
  # end
end
