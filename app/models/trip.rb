class Trip<ActiveRecord::Base
  belongs_to :bike
  belongs_to :zipcode
  belongs_to :subscription_type
  belongs_to :date_ref
  belongs_to :end_date, :class_name => "DateRef"

  # belongs_to :start_station, :class_name => "Station"
  # belongs_to :end_station, :class_name => "Station"

  belongs_to :start_station, foreign_key: "start_station_id", class_name: "Station"
  belongs_to :end_station, foreign_key: "end_station_id", class_name: "Station"

  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true
  validates :date_ref_id, presence: true
  validates :end_date_id, presence: true
  validates :start_station_id, presence: true
  validates :end_station_id, presence: true

  def self.update(params)
    trip = params[:trip]

    start_date = trip[:start_date].split('T')[0]
    start_date = DateRef.find_or_create_by!(date: start_date)

    end_date = trip[:end_date].split('T')[0]
    end_date = DateRef.find_or_create_by!(date: end_date)

    bike = Bike.find_or_create_by!(bike: trip[:bike])

    zipcode =
      if  trip[:zipcode].nil?
        nil
      else
        Zipcode.find_or_create_by!(zipcode: (trip[:zipcode][0..4]))
      end

    subscription = SubscriptionType.find_or_create_by!(sub_type: trip[:subscription])

    start_station = Station.find(trip[:start_station].to_i)
    end_station = Station.find(trip[:end_station].to_i)

    Trip.create!(date_ref_id: start_date.id,
                end_date_id: end_date.id,
                start_station_id: start_station.id,
                end_station_id: end_station.id,
                bike_id: bike.id,
                zipcode_id: zipcode.nil? ? "00000" : zipcode.id,
                subscription_type_id: subscription.id)
  end
  
  def month
    self.date_ref.date.month
  end

  def year
    self.date_ref.date.year
  end

  def self_dashboard
    {
      average_duration_ride: Trip.average(:duration).to_i,
      longest_ride: Trip.maximum(:duration),
      shortest_ride: Trip.minimum(:duration),
      popular_starting_station: Trip.group(:start_station).order("count_id DESC").count(:id).first[0].name,
      popular_ending_station: Trip.group(:end_station).order("count_id DESC").count(:id).first[0].name,
      month_breakdown: 0,
      most_ridden_bike: Trip.group(:bike).order("count_id DESC").count(:id).first[0].bike,
      least_ridden_bike: Trip.group(:bike).order("count_id ASC").count(:id).first[0].bike,
      subscription_breakout: Trip.group(:subscription_type).order("count_id DESC").count(:id).map{|k, v| {k.sub_type=> [v, (v/Trip.count.to_f).round(2)]}}.inject(:merge)
      top_trip_date: Trip.group(:date_ref).order("count_id DESC").count(:id).map{|k, v| {k.date => v}}.inject(:merge).first
      lowest_trip_date: Trip.group(:date_ref).order("count_id ASC").count(:id).map{|k, v| {k.date => v}}.inject(:merge).first
    }
  end
end
