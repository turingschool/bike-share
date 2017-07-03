class BikeShareDate < ActiveRecord::Base
  def self.create_by_date(date)
    find_or_create_by(date: Date.parse(date, '%Y-%m-%d')).id
  end
end
