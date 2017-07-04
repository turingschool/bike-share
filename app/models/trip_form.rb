class TripForm
  include ActiveModel::Model
#needs lots of work, barely debugged, not sure all is necessary
  attr_accessor(
    :duration,
    :start_date,
    :start_station,
    :end_date,
    :end_station,
    :bike_id,
    :subscription_type,
    :zip_code
)

    validates  :duration, presence: true
    validates  :start_date, presence: true
    validates  :start_station, presence: true
    validates  :end_date, presence: true
    validates  :end_station, presence: true
    validates  :bike_id, presence: true
    validates  :subscription_type, presence: true
    validates  :zip_code, presence: true

  def initialize(params)
    # @station_name = StationName.find_or_initialize_by(name: params[:name])
    @duration = params[:duration]
    @start_date = params[:start_date]
    @start_station = params[:start_station]
    @end_date = params[:end_date]
    @end_station = params[:end_station]
    @subscription_type = params[:subscription_type]
    @bike_id = params[:bike_id]
    @zip_code = params[:zip_code]
  end

  def save
    if valid?
      #save_duration = duration.find_or_initialize_by(duration: @duration)
      save_start_date = BikeShareDate.find_or_create_by!(bike_share_date: @start_date)
      save_start_station = StationName.find_or_create_by!(name: @start_station_name)
      save_end_date = BikeShareDate.find_or_create_by!(bike_share_date: @end_date)
      save_end_station = StationName.find_or_create_by!(name: @end_station_name)
      save_subscrption_type = SubscriptionType.find_or_create_by!(name: @subscription_type)
      #save_bike_id = bike_id.find_or_initialize_by(bike_id: @bike_id)
      save_zip_code = ZipCode.find_or_create_by!(zip_code: @zip_code)

      @trip = Trip.new(       duration: @duration,
                              start_date_id: save_start_date,
                              start_station_name_id: save_start_station,
                              end_date_id: save_end_date,
                              end_station_name_id: save_end_station,
                              subscription_type: save_subscrption_type,
                              bike_id: @bike_id,
                              zip_code_id: save_zip_code
                              )
     return  @trip.save
   end
   false
 end
end
