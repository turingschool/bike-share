class TripForm
  include ActiveModel::Model
#needs lots of work, barely debugged, not sure all is necessary
  attr_accessor(
    :duration,
    :start_date,
    :start_station_name,
    :end_date,
    :end_station_name,
    :bike_id,
    :zip_code
  )

  # validates  :duration, presence: true

  def initialize(params)
    # @station_name = StationName.find_or_initialize_by(name: params[:name])
    @duration = params[:duration]
    @start_date = params[:start_date]
    @start_station_name = params[:start_station_name]
    @end_date = params[:end_date]
    @end_station_name = params[:end_station_name]
    @bike_id = params[:bike_id]
    @zip_code = params[:zip_code]
  end

  def save
    if valid?
      #save_city = city.find_or_initialize_by(name: @city)

      save_duration = duration.find_or_initialize_by(duration: @duration)
      save_start_date = start_date.find_or_initialize_by(bike_share_date: @start_date)
      save_start_station_name = station_name.find_or_initialize_by(name: @start_station_name)
      save_end_date = end_date.find_or_initialize_by(bike_share_date: @end_date)
      save_end_station_name = station_name.find_or_initialize_by(name: @end_station_name)
      save_bike_id = bike_id.find_or_initialize_by(bike_id: @bike_id)
      save_zip_code = zip_code.find_or_initialize_by(zip_code: @zip_code)

      @trip = Trip.new(duration: save_duration,
                              start_date: save_start_date,
                              city: save_city,
                              installation_date_id: save_date.id,
                              start_station_name: save_start_station_name,
                              end_date: save_end_date,
                              end_station_name: save_end_station_name,
                              bike_id: save_bike_id,
                              zip_code: save_zip_code
                              )
     return  @trip.save
   end
   # return @trip.save if valid?
   false
 end
end

#
#       save_city = city.find_or_initialize_by(name: @city)
#       save_date =  installation_date.find_or_initialize_by(bike_share_date: @installation_date)
#       @station = Station.new(station_name: save_name,
#                               dock_count: @dock_count,
#                               city: save_city,
#                               installation_date_id: save_date.id
#                               )
#      return  @station.save
#     end
#     # return @station.save if valid?
#     false
#   end
# end
