require_relative '../models/station.rb'

class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :index
  end

  get '/stations/new' do
    erb :new
  end

  post '/stations' do
    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :show
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :edit
  end

  put '/stations/:id' do
    station = Station.find(params[:id])
    station.update(params[:station])
    redirect "/stations/#{params[:id]}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

  get '/conditions' do
    @conditions = Condition.all
    erb :condition_index
  end

  get '/conditions/new' do
    erb :condition_new
  end

  post '/conditions' do
    Condition.create(params[:condition])
    redirect '/conditions'
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :condition_show
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :condition_edit
  end

  put '/conditions/:id' do
    condition = Condition.find(params[:id])
    condition.update(params[:condition])
    redirect "/conditions/#{params[:id]}"
  end

  delete '/conditions/:id' do
    Condition.destroy(params[:id])
    redirect '/conditions'

  get '/station-dashboard' do
    @stations = Station.all
    erb :'station-dashboard'
  end

end
