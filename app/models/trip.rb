class Trip < ActiveRecord::Base
    belongs_to :zipcode
    belongs_to :subscription

    belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
    belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

    # validates :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, presence: true

  def create_trip(params)
    Trip.create!(duration: params[:trip][:duration],
      start_station: Station.find_or_create_by(params[:trip][:start_station]),
      end_station: Station.find_or_create_by(params[:trip][:end_station]),
      bike_id: params[:trip][:bike_id],
      subscription: subscription,
      zip_code: zip_code,
      start_date: params[:trip][:start_date],
      end_date: params[:trip][:end_date])
  end
end
