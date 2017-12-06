class Condition < ActiveRecord::Base
  has_many :trips, class_name: "Trip", foreign_key: "date"

  def self.date_id(date)
    find_by(date: date).id
  end

end
