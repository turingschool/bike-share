require 'date'
class Trip<ActiveRecord::Base
  belongs_to :bike
  belongs_to :zipcode
  belongs_to :subscription_type
  belongs_to :date_ref
  belongs_to :end_date, :class_name => "DateRef"

  belongs_to :start_station, foreign_key: "start_station_id", class_name: "Station"
  belongs_to :end_station, foreign_key: "end_station_id", class_name: "Station"

  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true
  validates :date_ref_id, presence: true
  validates :end_date_id, presence: true
  validates :start_station_id, presence: true
  validates :end_station_id, presence: true

  def name
    "Trip: #{self.id}"
  end

  def self.sterilize(params)
    trip = params[:trip]

    { 
      start_date: Trip.validate_date(trip[:start_date]), 
      end_date: Trip.validate_date(trip[:end_date]), 
      bike: Bike.find_or_create_by!(bike: trip[:bike]), 
      zipcode: Trip.zip_validate(trip[:zipcode]), 
      subscription: SubscriptionType.find_or_create_by!(sub_type: trip[:subscription]), 
      start_station: Station.find(trip[:start_station].to_i) , 
      end_station: Station.find(trip[:end_station].to_i) 
    }
  end

  def self.validate_date(date)
    date = date.split('T')[0]
    DateRef.find_or_create_by!(date: date)
  end

  def self.zip_validate(zipcode)
    if  zipcode.empty?
      Zipcode.find_or_create_by!(zipcode: "n/a")
    else
      Zipcode.find_or_create_by!(zipcode: (zipcode[0..4]))
    end
  end

  def self.create_new(params)
    trip_data = sterilize(params)
    Trip.create!(
            date_ref_id: trip_data[:start_date].id,
            end_date_id: trip_data[:end_date].id,
            start_station_id: trip_data[:start_station].id,
            end_station_id: trip_data[:end_station].id,
            bike_id: trip_data[:bike].id,
            zipcode_id: trip_data[:zipcode].id,
            subscription_type_id: trip_data[:subscription].id)
  end

  def self.update_record(params)
    trip_data = sterilize(params)
    Trip.update(params[:id],
        date_ref_id: trip_data[:start_date].id,
        end_date_id: trip_data[:end_date].id,
        start_station_id: trip_data[:start_station].id,
        end_station_id: trip_data[:end_station].id,
        bike_id: trip_data[:bike].id,
        zipcode_id: trip_data[:zipcode].id,
        subscription_type_id: trip_data[:subscription].id)
  end

  def self.dashboard
    {
      average_duration_ride: Trip.average(:duration).to_i,
      longest_ride: Trip.longest_ride_data,
      shortest_ride: Trip.shortest_ride_data,
      popular_starting_station: Trip.group(:start_station).order("count_id DESC").count(:id).first[0].name,
      popular_ending_station: Trip.group(:end_station).order("count_id DESC").count(:id).first[0].name,
      month_breakdown: Trip.month_breakdown_data,
      most_ridden_bike: Trip.group(:bike).order("count_id DESC").count(:id).first[0].bike,
      least_ridden_bike: Trip.group(:bike).order("count_id ASC").count(:id).first[0].bike,
      subscription_breakout: Trip.sort_subscription_breakout(subscription_query),
      top_trip_date: Trip.sort_hash_merge(Trip.trip_date_query('DESC')),
      lowest_trip_date:Trip.sort_hash_merge(Trip.trip_date_query('ASC'))
    }
  end


  

  def self.month_breakdown_data
    break_down = DateRef.distinct.pluck('extract(year from date)').map{ |date| {date => Trip.sort_trips_by_date(date)}}
    break_down.reduce Hash.new, :merge
    
  end

  def self.shortest_ride_data
    trip = Trip.where(duration: Trip.minimum(:duration))
    duration = Trip.minimum(:duration)
    {
      start: trip.first.start_station.name,
      end: trip.first.end_station.name,
      duration: Trip.convert_duration(duration)
    }
  end

  def self.longest_ride_data
    trip = Trip.where(duration: Trip.maximum(:duration))
    duration = Trip.maximum(:duration)
    {
      start: trip.first.start_station.name,
      end: trip.first.end_station.name,
      duration: Trip.convert_duration(duration)
    }
  end

  def self.convert_duration(duration)
    if duration <= 60
      "Hours: 00 Min: 00 Sec:#{duration}"
    elsif ((duration/60)/60) > 23
      days = (((duration/60)/60))/24
      hr = ((duration/60)/60) % 24
      mn = (duration/60) % 60
      sc = duration % 60
      "Days: #{days} Hours: #{hr} Min: #{mn} Sec: #{sc}"
    elsif (duration/60) > 59
      hr = ((duration/60)/60)
      mn = (duration/60) % 60
      sc = duration % 60
      "Hours: #{hr} Min: #{mn} Sec:#{sc}"
    elsif  
      sc = duration % 60
      mn = (duration/60).to_i
      "Hours: 00 Min: #{mn} Sec: #{sc}"
    end
  end

  def self.sort_trips_by_date(date)
    trip = Trip.joins(:date_ref)
        .where('extract(year from date) = ?', date)
        .group('extract(month from date)')
        .order('count_id DESC')
        .count(:id)
    trip = trip.sort.to_h
    trip.transform_keys do |key|
      Date::MONTHNAMES[key]
    end
    
  end


  def self.sort_subscription_breakout(array)
    array.map{|k, v| {k.sub_type=> [v, (v/Trip.count.to_f).round(2)]}}.inject(:merge)
  end
  
  def self.subscription_query
   Trip.group(:subscription_type).order("count_id DESC").count(:id) 
  end

  def self.sort_hash_merge(array)
    array.map{|k, v| {k.date => v}}.inject(:merge).first
  end

  def self.trip_date_query(mode)
    Trip.group(:date_ref).order("count_id #{mode}").count(:id)
  end

  def self.page_load(id)
    Trip.limit(30).offset(id.to_i * 30)
  end


end
