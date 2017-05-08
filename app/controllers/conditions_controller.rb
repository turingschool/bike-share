class ConditionsController < BikeShareApp
  set :views, File.join(APP_ROOT, "app", "views", "conditions")

  get '/conditions/new' do
    erb :"new"
  end
end
