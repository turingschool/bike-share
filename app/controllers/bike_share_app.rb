require 'pry'

class BikeShareApp < Sinatra::Base

  set :method_override, true 

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  

end
