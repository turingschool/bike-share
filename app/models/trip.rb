class Trip < ActiveRecord::Base
    belongs_to :zipcode
    belongs_to :subscription
    belongs_to :condition

    belongs_to :bike

    belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
    belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

    validates :duration, :start_date, :start_station_id, :bike_id, :end_date, :end_station_id, presence: true

    def self.average_duration_of_ride
      Trip.average(:duration).round
    end

    def self.longest_ride
      Trip.maximum(:duration)
    end

    def self.shortest_ride
      Trip.minimum(:duration)
    end


  def self.create_trip(params)
    Trip.create!(duration: params[:trip][:duration],
      start_station: Station.find_or_create_by(name: params[:trip][:start_station]),
      end_station: Station.find_or_create_by(name: params[:trip][:end_station]),
      bike_id: params[:trip][:bike_id],
      subscription: Subscription.find_or_create_by(subscription: params[:trip][:subscription]),
      zipcode: Zipcode.find_or_create_by(zip_code: params[:trip][:zip_code]),
      start_date: params[:trip][:start_date],
      end_date: params[:trip][:end_date])
  end

  def self.update_trip(params)
    Trip.update(duration: params[:trip][:duration],
      start_station: Station.find_or_create_by(name: params[:trip][:start_station]),
      end_station: Station.find_or_create_by(name: params[:trip][:end_station]),
      bike_id: params[:trip][:bike_id],
      subscription: Subscription.find_or_create_by(subscription: params[:trip][:subscription]),
      zipcode: Zipcode.find_or_create_by(zip_code: params[:trip][:zip_code]),
      start_date: params[:trip][:start_date],
      end_date: params[:trip][:end_date])
  end
end
