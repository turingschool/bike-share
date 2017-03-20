require 'pry'

class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"home/index"
  end

  get '/stations' do
    @stations = Station.all
    erb :"station/index"
  end



  get '/stations/new' do
    erb :"station/new"
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id' do
    id = params[:id]
    @station = Station.find(id)
    erb :"station/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])

    erb :"station/edit"
  end

end
