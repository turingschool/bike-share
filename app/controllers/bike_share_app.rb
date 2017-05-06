require 'pry'

class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/stations' do
    erb :"stations/index"
  end

  get '/stations/view_all' do
    @stations = Station.all
    erb :"stations/view_all"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  put '/stations/:id' do
    Station.update(params[:id], params[:station])
    redirect '/stations'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do
    Station.update(params[:id], params[:station])
    redirect "/stations"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect "/stations/view_all"
  end

end
