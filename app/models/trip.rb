class Trip < ActiveRecord::Base
  has_many :stations

  belongs_to :zip_code
  belongs_to :trip_date
  belongs_to :subscription_type

  def self.find_thirty_trips(start_index)
    find_range = (start_index...(start_index + 30)).to_a
    order(:trip_date).find(find_range)
  end

end
