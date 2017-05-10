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
    @city = City.new()
    @station = Station.new()
    erb :"stations/new"
  end

  post '/stations/new' do
    @city = City.find_or_create_by(name: params[:city])
    @station = Station.new(params[:station])
    if @station.invalid? || @city.invalid?
      @city.invalid? 
      erb :"stations/new"
    else
      @station.save
      @city.stations << @station
      redirect "stations/#{@station.id}"
    end 
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

  get '/conditions/' do
    redirect '/conditions'
  end

  get '/conditions' do
    @conditions = Condition.all
    erb :"conditions/index"
  end

  get '/conditions/new' do
    @city = City.new()
    @condition = Condition.new()

    erb :"conditions/new"
  end

  post '/conditions/new' do
    @city = City.find_or_create_by(name: params[:city])
    @condition = Condition.new(params[:condition])
    if @condition.invalid? || @city.invalid?
      @city.invalid? 
      erb :"conditions/new"
    else
      @condition.save
      @city.conditions << @condition
      redirect "conditions/#{@condition.id}"
    end 
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    @city = @condition.city
    erb :"conditions/edit"
  end

  put '/conditions/:id' do
    @city = City.find_or_create_by(name: params[:city])
    @condition = Condition.new(params[:station])

    if @city.invalid? || @condition.invalid?
      @condition.invalid?
      erb :"stations/edit"
    else
      params[:condition][:city_id] = @city.id
      Condition.find(params[:id]).update(params[:condition])
      redirect "conditions/#{params[:id]}"
    end
  end

  delete '/conditions/:id' do
    condition = Condition.find(params[:id])
    condition.destroy

    redirect '/conditions'
  end
.find
end
