require 'pry'

class BikeShareApp < Sinatra::Base

  get '/' do
    "Hi"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  post '/stations' do
    City.create(params[:city])
    ci = City.find_by(params[:city]).id
    params[:station][:city_id] = ci
    Station.create(params[:station])
    redirect "/stations"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'stations/edit'
  end

  put '/stations/:id' do
    @station = Station.update(params[:id], params[:station])

    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect '/stations'
  end
end
