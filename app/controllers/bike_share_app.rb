require_relative 'pagination'

class BikeShareApp < Sinatra::Base
  set :method_override, true

  include Pagination

  get "/" do
    redirect "/station_dashboard"
  end

  get "/station_dashboard" do
    @station = Station.all
    erb :"stations/station_dashboard"
  end

  get "/stations" do
    @stations = Station.all
    erb :"stations/index"
  end

  get "/stations/new" do
    @station = Station.new
    @city = City.all
    erb :"stations/new"
  end

  post "/stations" do
    city_name = params[:station][:city]
    city = City.find_or_create_by(city: city_name)

    input = { name: params[:station][:name],
              dock_count: params[:station][:dock_count],
              city: city,
              installation_date: params[:station][:installation_date]
              }


    @station = city.stations.create(input)
    redirect "/stations"
  end

  get "/stations/:id/edit" do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put "/stations/:id" do
    city_name = params[:station][:city]
    city = City.find_or_create_by(city: city_name)

    input = { name: params[:station][:name],
              dock_count: params[:station][:dock_count],
              city: city,
              installation_date: params[:station][:installation_date]
              }

    @station = Station.update(params[:id], input)
    redirect "/stations/#{@station.id}"
  end

  get "/stations/:id" do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  delete "/stations/:id" do
    Station.destroy(params[:id])
    redirect "/stations"
  end

  get "/trips" do
    redirect "/trips/page/1"
  end

  get "/trips/page/:num" do |page_num|
    trips     = Trip.where.not(start_date: nil)
    @trips    = on_page(trips, page_num.to_i)
    @next     = next_page(page_num.to_i, trips.count)
    @previous = previous_page(page_num.to_i)
 
    erb :"trips/index"
  end

  private

  # ITEMS_PER_PAGE = 30
  #
  # def on_page(items, page_num)
  #   items.limit(ITEMS_PER_PAGE).offset((page_num - 1) * ITEMS_PER_PAGE)
  # end
  #
  # def total_pages(item_count)
  #   (item_count / ITEMS_PER_PAGE).ceil
  # end
  #
  # def next_page(page_num, item_count)
  #   page_num + 1 unless page_num <= total_pages(item_count)
  # end
  #
  # def previous_page(page_num)
  #   page_num - 1 unless page_num <= 1
  # end


end
