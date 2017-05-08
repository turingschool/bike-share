require './app/controllers/bike_share_app'

class ConditionsController < BikeShareApp

  get '/conditions' do
    @conditions = Condition.all
    erb :"conditions/index"
  end

  get '/contitions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  get '/conditions/new' do 
    erb :"conditions/new"
  end

  post '/conditions/new' do
    Condition.create(params)
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :"conditions/edit"
  end

  put '/conditions/:id' do
    condition = Condition.find(params[:id])
    condition.update(params[:condition])
    
    redirect '/conditions'
  end

end
