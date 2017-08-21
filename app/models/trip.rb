class Trip < ActiveRecord::Base
  has_many :stations

  belongs_to :start_date
  belongs_to :end_date
  belongs_to :zip_code
  belongs_to :subscription_type

  # validates :duration, :start_date, :end_date, :start_station, :end_station, :bike_id, :subscription_type_id, presence: true

  def self.find_thirty_trips(start_index)
    find_range = (start_index...(start_index + 30)).to_a
    find(find_range)
  end

  def self.reset_ids
    ActiveRecord::Base.connection.reset_pk_sequence!('trips')
  end

  def self.sort_trips_by_date
    order(:start_date)
  end
end
