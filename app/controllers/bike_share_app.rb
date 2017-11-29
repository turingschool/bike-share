class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"/dashboard"
  end
end
