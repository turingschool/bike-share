class RideDate < ActiveRecord::Base
  has_many :trips

  validates :day, presence: true
  validates :month, presence: true
  validates :year, presence: true

  def self.format_date_hash(unformatted_date)
    date_elements = unformatted_date.split("-")
    formatted_date = {day: date_elements[1], month: date_elements[2], year: date_elements[0]}
  end
end
