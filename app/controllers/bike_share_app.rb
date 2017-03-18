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
		# binding.pry
		Station.create(params[:station])
		redirect '/stations'
	end
end
