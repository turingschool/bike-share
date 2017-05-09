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
end
