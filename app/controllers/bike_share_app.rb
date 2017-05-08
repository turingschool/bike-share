class BikeShareApp < Sinatra::Base
  get '/stations/new' do
    @station = Station.new
    erb :'stations/new'
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :"stations/show"
  end

  put '/stations/:id' do |id|
    station_details = params[:station]
    station_details[:installation_date] = Date.strptime(station_details[:installation_date],'%m/%d/%Y')
    @station = Station.update(id, station_details)
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id)
    redirect "/stations"
  end

  get '/stations/:id/edit' do |id|
    @station = Station.find(id)
    erb :"stations/edit"
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

  get '/stations-dashboard' do
    @stations = Station.all
    erb :"stations/dashboard", :locals => {
      :count => Station.count,
      :average_bikes => Station.average_bikes,
      :most_bikes_count => Station.most_bikes_count,
      :most_bikes_avail_at => Station.most_bikes_avail_at,
      :fewest_bikes_count => Station.fewest_bikes_count,
      :fewest_bikes_avail_at => Station.fewest_bikes_avail_at,
      :newest_station => Station.newest_station,
      :oldest_station => Station.oldest_station
    }
  end
end
