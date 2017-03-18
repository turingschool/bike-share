class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"home/index"
  end

  get '/stations' do
    erb :"stations/index"
  end

end
