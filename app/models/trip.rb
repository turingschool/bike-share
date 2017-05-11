class Trip < ActiveRecord::Base
  belongs_to :start_station
  belongs_to :end_station
  belongs_to :subscription_type
  belongs_to :start_date, :class_name => 'RideDate', :foreign_key => 'start_date_id'
  belongs_to :end_date, :class_name => 'RideDate', :foreign_key => 'end_date_id'

  validates :duration, presence: true
  validates :start_date_id, presence: true
  validates :start_station_id, presence: true
  validates :end_date_id, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true

  def self.subscription_type_percentage(subscription_id)
    total_subscribers = Trip.where(subscription_type_id: subscription_id).count
    percentage = (total_subscribers / Trip.all.count.to_f) * 100
    percentage.to_i.to_s + "%"
  end

  def self.dashboard_analysis
    {average_duration: Trip.average(:duration).round,
    monthly_breakdown: monthly_breakdown,
    longest_ride_id: Trip.order("duration DESC").first.id,
    shortest_ride_id: Trip.order("duration DESC").last.id,
    most_common_starting_station: Trip.most_common_starting_station


    }
  end

  def self.most_common_starting_station
    StartStation.find(Trip.group(:start_station_id).order('count_id asc').count('id').keys.last).station.name
  end

  def self.get_months_and_years
    months_and_years = {}
    years = RideDate.distinct.pluck(:year)
    years.map do |year|
      months_and_years[year] = RideDate.where(year: year).distinct.pluck(:month)
    end
    months_and_years
  end

  def self.year_month_pairs
    year_month = []
    Trip.get_months_and_years.each do |year, months|
      year_month << months.map do |month|
        [year, month]
      end
    end
    year_month
  end

  def self.get_all_ride_dates
    days = {}
    Trip.year_month_pairs.each do |year_of_months|
      year_of_months.map do |month|
        days[month] = RideDate.where(year: month.first, month: month.last)
      end
    end
    days
  end

  def self.get_monthly_totals
    monthly_totals = {}
    Trip.get_all_ride_dates.each do |month, all_the_days|
      monthly_totals[month] = all_the_days.map do |individual_day|
        individual_day.trips.count
      end
    end
    monthly_totals
  end

  def self.monthly_breakdown
    monthly_totals = Trip.get_monthly_totals
    month_by_month = {}
    monthly_totals.each do |month, daily_totals|
      month_by_month[month] = daily_totals.inject(0){|sum,x| sum + x }
    end
    month_by_month
  end

end
