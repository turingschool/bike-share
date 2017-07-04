class BikeShareDate < ActiveRecord::Base
  def self.create_by_date(date)
    find_or_create_by(date: Date.strptime(date, '%Y-%m-%d')).id
  end

  def self.seed_by_date(date)
    # require "pry";binding.pry
    find_or_create_by(date: Date.strptime(date, '%m/%d/%Y')).id
  end
end
