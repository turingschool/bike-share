class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"home/index"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    @station = Station.new
    @cities = City.all
    erb :"stations/new"
  end

  post '/stations' do
    city_name = params[:station][:city]
    city = City.find_or_create_by(name: city_name)
    input = {
      name: params[:station][:name],
      dock_count: params[:station][:dock_count],
      installation_date: params[:station][:installation_date]
    }
    @station = city.stations.create(input)
    redirect "/stations/#{@station.id}"
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

    city_name = params[:station][:city]
    city = City.find_or_create_by(name: city_name)
    input = {
      name: params[:station][:name],
      dock_count: params[:station][:dock_count],
      city_id: city.id.to_s,
      installation_date: params[:station][:installation_date]
    }
    station = Station.find(params[:id]).update(input)

    redirect "/stations/#{params[:id]}"

  end

  delete '/stations/:id' do
    Station.destroy(params[:id])

    redirect '/stations'
  end
end
