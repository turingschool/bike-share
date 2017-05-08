class BikeShareApp < Sinatra::Base
  get '/' do
    redirect('/stations')
  end
end
