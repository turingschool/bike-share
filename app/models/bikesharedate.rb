class BikeShareDate < ActiveRecord::Base
  validates_presence_of :date

  def self.create_by_date(date)
    find_or_create_by(date: Date.strptime(date, '%Y-%m-%d')).id
  end

  def self.seed_by_date(date)
    find_or_create_by(date: Date.strptime(date, '%m/%d/%Y')).id
  end
end
