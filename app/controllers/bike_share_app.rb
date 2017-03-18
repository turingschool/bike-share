require 'pry'
class BikeShareApp < Sinatra::Base

  get '/stations' do
    @stations = Station.all

    erb :"stations/index"
  end

  get '/stations/new' do
    @stations = Station.new

    erb :"stations/new"
  end

  post '/stations' do
    station = Station.create(params[:station])
    # binding.pry
    redirect "/stations/#{station.id}"
  end

  get '/stations/:id' do
    @stations = Station.find(params[:id])

    erb :"stations/show"
  end

end
