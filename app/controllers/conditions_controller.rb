require './app/controllers/bike_share_app'

class ConditionsController < BikeShareApp

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

end
