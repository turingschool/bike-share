class ConditionsController < BikeShareApp
  set :views, File.join(APP_ROOT, "app", "views", "conditions")

  get '/conditions/new' do
    @condition = Condition.new
    erb :'new'
  end

  post '/conditions' do
    condition_details = params[:condition]
    condition_details[:date] = Date.strptime(condition_details[:date], '%m/%d/%Y')
    @condition = Condition.create!(condition_details)
    redirect "/conditions/#{@condition.id}"
  end


  get '/conditions/:id/edit' do |id|
    @condition = Condition.find(id)
    erb :"edit"
  end

  get '/conditions/:id' do |id|
    @condition = Condition.find(id)
    erb :"show"
  end

  put '/conditions/:id' do |id|
    @condition = Condition.update(id)
    redirect "/conditions/#{id}"
  end
end
