class StationsController < Sinatra::Base
  get '/stations/new' do
    @station = Station.new
    erb :'new'
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :"show"
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
    erb :"edit"
  end

  get '/stations' do
    @stations = Station.all
    erb :"index"
  end

  post '/stations' do
    station_details = params[:station]
    station_details[:installation_date] = Date.strptime(station_details[:installation_date],'%m/%d/%Y')
    @station = Station.create!(station_details)
    redirect "/stations/#{@station.id}"
  end

  get '/stations-dashboard' do
    @stations = Station.all
    erb :"dashboard", :locals => {
      :count => Station.count,
      :average_bikes => Station.average(:dock_count),
      :most_bikes_count => Station.maximum(:dock_count),
      :most_bikes_avail_at => Station.where(dock_count: Station.maximum(:dock_count)).pluck(:name).join(', '),
      :fewest_bikes_count => Station.minimum(:dock_count),
      :fewest_bikes_avail_at => Station.where(dock_count: Station.minimum(:dock_count)).pluck(:name).join(', '),
      :newest_station => Station.where(installation_date: Station.maximum(:installation_date)).pluck(:name).join(', '),
      :oldest_station => Station.where(installation_date: Station.minimum(:installation_date)).pluck(:name).join(', ')
    }
  end
end
