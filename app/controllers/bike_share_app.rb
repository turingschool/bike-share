class BikeShareApp < Sinatra::Base
  set :views, File.join(APP_ROOT, "app", "views")

  get '/' do
    redirect('/stations')
  end
end
