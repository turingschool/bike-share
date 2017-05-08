require './app/controllers/bike_share_app'

class ConditionsController < BikeShareApp

  get '/conditions' do
    @conditions = Condition.all
    erb :"conditions/index"
  end

  get 'contitions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

end
