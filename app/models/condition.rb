class Condition < ActiveRecord::Base
  has_many :trips, class_name: "Trip", foreign_key: "date"

  def self.date_id(date)
    find_by(date: date).id
  end

  def self.max_temp_range_40_to_49
    select(:id).where(:max_temperature => (40..49)).count
  end

end
