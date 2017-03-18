require 'pry'
class BikeShareApp < Sinatra::Base

	get '/stations/new' do
		#inst var (AR methods)
		erb :new_station
	end

	get '/stations' do
		@stations = Station.all
		erb :station_index
	end

	post '/stations' do
		Station.create(params[:station])

    if params["station"].any? {|_, value| value.empty?}
      redirect 'stations/new'
    end
		redirect '/stations'
	end
end
