class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"/stations/index"
  end
end
