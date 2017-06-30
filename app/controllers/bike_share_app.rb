require 'pry'

class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"home/index"
  end

# Station App

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  post '/stations/new' do
    city = City.find_or_create_by(name: params[:city])
    station = city.stations.create(params[:station])
    redirect "stations/#{station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    @city = @station.city
    erb :"stations/edit"
  end

  put '/stations/:id' do
    @city = City.find_or_create_by(name: params[:city])
    @station = Station.new(params[:station])

    if @city.invalid? || @station.invalid?
      erb :"stations/edit"
    else
      params[:station][:city_id] = @city.id
      Station.find(params[:id]).update(params[:station])

      redirect "/stations/#{params[:id]}"
    end

  end

  delete '/stations/:id' do
    station = Station.find(params[:id])
    station.destroy
    redirect '/stations'
  end

  # Conditions App

  get '/conditions' do
    @conditions = Weather.all
    erb :"conditions/index"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end

  post '/conditions/new' do
    condition = Weather.create(params[:condition])
    redirect "conditions/#{condition.id}"
  end

  get '/conditions/:id' do
    @condition = Weather.find(params[:id])
    erb :"conditions/show"
  end

  get '/conditions/:id/edit' do
    @condition = Weather.find(params[:id])
    erb :"conditions/edit"
  end

  put '/conditions/:id/edit' do
    condition = Weather.find(params[:id])
    condition.update(params[:condition])

    redirect "conditions/#{condition.id}"
  end

  delete '/conditions/:id' do
    condition = Weather.find(params[:id])
    station.destroy

    redirect '/conditions'
  end
.find
end