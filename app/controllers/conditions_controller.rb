class ConditionsController < BikeShareApp
  set :views, File.join(APP_ROOT, "app", "views", "conditions")

  get '/conditions/:id/edit' do |id|
    @condition = Condition.find(id)
    erb :"edit"
  end

  put '/conditions/:id' do |id|
    @condition = Condition.update(id)
    redirect "/conditions/#{id}"
  end
end
